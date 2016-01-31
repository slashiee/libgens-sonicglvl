/****************************************************************************
**
** Copyright (C) 2015 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the QtGui module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL21$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see http://www.qt.io/terms-conditions. For further
** information use the contact form at http://www.qt.io/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 2.1 or version 3 as published by the Free
** Software Foundation and appearing in the file LICENSE.LGPLv21 and
** LICENSE.LGPLv3 included in the packaging of this file. Please review the
** following information to ensure the GNU Lesser General Public License
** requirements will be met: https://www.gnu.org/licenses/lgpl.html and
** http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** As a special exception, The Qt Company gives you certain additional
** rights. These rights are described in The Qt Company LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
** $QT_END_LICENSE$
**
****************************************************************************/
#ifndef QFONTENGINE_FT_P_H
#define QFONTENGINE_FT_P_H
//
//  W A R N I N G
//  -------------
//
// This file is not part of the Qt API.  It exists purely as an
// implementation detail.  This header file may change from version to
// version without notice, or even be removed.
//
// We mean it.
//

#include "private/qfontengine_p.h"

#ifndef QT_NO_FREETYPE

#include <ft2build.h>
#include FT_FREETYPE_H


#ifndef Q_OS_WIN
#include <unistd.h>
#endif

#include <qmutex.h>

QT_BEGIN_NAMESPACE

class QFontEngineFTRawFont;
class QFontconfigDatabase;

/*
 * This class represents one font file on disk (like Arial.ttf) and is shared between all the font engines
 * that show this font file (at different pixel sizes).
 */
class QFreetypeFace
{
public:
    void computeSize(const QFontDef &fontDef, int *xsize, int *ysize, bool *outline_drawing);
    QFontEngine::Properties properties() const;
    bool getSfntTable(uint tag, uchar *buffer, uint *length) const;

    static QFreetypeFace *getFace(const QFontEngine::FaceId &face_id,
                                  const QByteArray &fontData = QByteArray());
    void release(const QFontEngine::FaceId &face_id);

    // locks the struct for usage. Any read/write operations require locking.
    void lock()
    {
        _lock.lock();
    }
    void unlock()
    {
        _lock.unlock();
    }

    FT_Face face;
    int xsize; // 26.6
    int ysize; // 26.6
    FT_Matrix matrix;
    FT_CharMap unicode_map;
    FT_CharMap symbol_map;

    enum { cmapCacheSize = 0x200 };
    glyph_t cmapCache[cmapCacheSize];

    int fsType() const;

    int getPointInOutline(glyph_t glyph, int flags, quint32 point, QFixed *xpos, QFixed *ypos, quint32 *nPoints);

    static void addGlyphToPath(FT_Face face, FT_GlyphSlot g, const QFixedPoint &point, QPainterPath *path, FT_Fixed x_scale, FT_Fixed y_scale);
    static void addBitmapToPath(FT_GlyphSlot slot, const QFixedPoint &point, QPainterPath *path);

private:
    friend class QFontEngineFT;
    friend class QtFreetypeData;
    friend struct QScopedPointerDeleter<QFreetypeFace>;
    QFreetypeFace() : _lock(QMutex::Recursive) {}
    ~QFreetypeFace() {}
    void cleanup();
    QAtomicInt ref;
    QMutex _lock;
    QByteArray fontData;

    void *hbFace;
    qt_destroy_func_t hbFace_destroy_func;
};

// If this is exported this breaks compilation of the windows
// plugin as qfontengine_ft_p.h/.cpp are also compiled there
#ifndef Q_OS_WIN
class Q_GUI_EXPORT QFontEngineFT : public QFontEngine
#else
class QFontEngineFT : public QFontEngine
#endif
{
public:

    /* we don't cache glyphs that are too large anyway, so we can make this struct rather small */
    struct Glyph {
        ~Glyph();
        short linearAdvance;
        unsigned char width;
        unsigned char height;
        signed char x;
        signed char y;
        signed char advance;
        signed char format;
        uchar *data;
    };

    struct GlyphInfo {
        int             linearAdvance;
        unsigned short  width;
        unsigned short  height;
        short           x;
        short           y;
        short           xOff;
        short           yOff;
    };

    struct GlyphAndSubPixelPosition
    {
        GlyphAndSubPixelPosition(glyph_t g, QFixed spp) : glyph(g), subPixelPosition(spp) {}

        bool operator==(const GlyphAndSubPixelPosition &other) const
        {
            return glyph == other.glyph && subPixelPosition == other.subPixelPosition;
        }

        glyph_t glyph;
        QFixed subPixelPosition;
    };

    struct QGlyphSet
    {
        QGlyphSet();
        ~QGlyphSet();
        FT_Matrix transformationMatrix;
        bool outline_drawing;

        void removeGlyphFromCache(glyph_t index, QFixed subPixelPosition);
        void clear();
        inline bool useFastGlyphData(glyph_t index, QFixed subPixelPosition) const {
            return (index < 256 && subPixelPosition == 0);
        }
        inline Glyph *getGlyph(glyph_t index, QFixed subPixelPosition = 0) const;
        void setGlyph(glyph_t index, QFixed spp, Glyph *glyph);

        inline bool isGlyphMissing(glyph_t index) const { return missing_glyphs.contains(index); }
        inline void setGlyphMissing(glyph_t index) const { missing_glyphs.insert(index); }
private:
        mutable QHash<GlyphAndSubPixelPosition, Glyph *> glyph_data; // maps from glyph index to glyph data
        mutable QSet<glyph_t> missing_glyphs;
        mutable Glyph *fast_glyph_data[256]; // for fast lookup of glyphs < 256
        mutable int fast_glyph_count;
    };

    virtual QFontEngine::FaceId faceId() const Q_DECL_OVERRIDE;
    virtual QFontEngine::Properties properties() const Q_DECL_OVERRIDE;
    virtual QFixed emSquareSize() const Q_DECL_OVERRIDE;
    virtual bool supportsSubPixelPositions() const Q_DECL_OVERRIDE
    {
        return default_hint_style == HintLight ||
               default_hint_style == HintNone;
    }

    virtual bool getSfntTableData(uint tag, uchar *buffer, uint *length) const Q_DECL_OVERRIDE;
    virtual int synthesized() const Q_DECL_OVERRIDE;

    virtual QFixed ascent() const Q_DECL_OVERRIDE;
    virtual QFixed descent() const Q_DECL_OVERRIDE;
    virtual QFixed leading() const Q_DECL_OVERRIDE;
    virtual QFixed xHeight() const Q_DECL_OVERRIDE;
    virtual QFixed averageCharWidth() const Q_DECL_OVERRIDE;

    virtual qreal maxCharWidth() const Q_DECL_OVERRIDE;
    virtual qreal minLeftBearing() const Q_DECL_OVERRIDE;
    virtual qreal minRightBearing() const Q_DECL_OVERRIDE;
    virtual QFixed lineThickness() const Q_DECL_OVERRIDE;
    virtual QFixed underlinePosition() const Q_DECL_OVERRIDE;

    virtual glyph_t glyphIndex(uint ucs4) const Q_DECL_OVERRIDE;
    void doKerning(QGlyphLayout *, ShaperFlags) const Q_DECL_OVERRIDE;

    virtual void getUnscaledGlyph(glyph_t glyph, QPainterPath *path, glyph_metrics_t *metrics) Q_DECL_OVERRIDE;

    virtual bool supportsTransformation(const QTransform &transform) const Q_DECL_OVERRIDE;

    virtual void addGlyphsToPath(glyph_t *glyphs, QFixedPoint *positions, int nglyphs,
                         QPainterPath *path, QTextItem::RenderFlags flags) Q_DECL_OVERRIDE;
    virtual void addOutlineToPath(qreal x, qreal y, const QGlyphLayout &glyphs,
                          QPainterPath *path, QTextItem::RenderFlags flags) Q_DECL_OVERRIDE;

    virtual bool stringToCMap(const QChar *str, int len, QGlyphLayout *glyphs, int *nglyphs, ShaperFlags flags) const Q_DECL_OVERRIDE;

    virtual glyph_metrics_t boundingBox(const QGlyphLayout &glyphs) Q_DECL_OVERRIDE;
    virtual glyph_metrics_t boundingBox(glyph_t glyph) Q_DECL_OVERRIDE;
    virtual glyph_metrics_t boundingBox(glyph_t glyph, const QTransform &matrix) Q_DECL_OVERRIDE;

    virtual void recalcAdvances(QGlyphLayout *glyphs, ShaperFlags flags) const Q_DECL_OVERRIDE;
    virtual QImage alphaMapForGlyph(glyph_t g) Q_DECL_OVERRIDE { return alphaMapForGlyph(g, 0); }
    virtual QImage alphaMapForGlyph(glyph_t, QFixed) Q_DECL_OVERRIDE;
    QImage alphaMapForGlyph(glyph_t glyph, QFixed subPixelPosition, const QTransform &t) Q_DECL_OVERRIDE;
    virtual QImage alphaRGBMapForGlyph(glyph_t, QFixed subPixelPosition, const QTransform &t) Q_DECL_OVERRIDE;
    virtual glyph_metrics_t alphaMapBoundingBox(glyph_t glyph,
                                                QFixed subPixelPosition,
                                                const QTransform &matrix,
                                                QFontEngine::GlyphFormat format) Q_DECL_OVERRIDE;
    virtual QImage *lockedAlphaMapForGlyph(glyph_t glyph, QFixed subPixelPosition,
                                           GlyphFormat neededFormat, const QTransform &t,
                                           QPoint *offset) Q_DECL_OVERRIDE;
    virtual bool hasInternalCaching() const Q_DECL_OVERRIDE { return cacheEnabled; }
    virtual void unlockAlphaMapForGlyph() Q_DECL_OVERRIDE;

    virtual void removeGlyphFromCache(glyph_t glyph) Q_DECL_OVERRIDE;
    virtual int glyphMargin(QFontEngine::GlyphFormat /* format */) Q_DECL_OVERRIDE { return 0; }

    virtual int glyphCount() const Q_DECL_OVERRIDE;

    enum Scaling {
        Scaled,
        Unscaled
    };
    FT_Face lockFace(Scaling scale = Scaled) const;
    void unlockFace() const;

    FT_Face non_locked_face() const;

    inline bool drawAntialiased() const { return antialias; }
    inline bool invalid() const { return xsize == 0 && ysize == 0; }
    inline bool isBitmapFont() const { return defaultFormat == Format_Mono; }

    inline Glyph *loadGlyph(uint glyph, QFixed subPixelPosition, GlyphFormat format = Format_None, bool fetchMetricsOnly = false) const
    { return loadGlyph(cacheEnabled ? &defaultGlyphSet : 0, glyph, subPixelPosition, format, fetchMetricsOnly); }
    Glyph *loadGlyph(QGlyphSet *set, uint glyph, QFixed subPixelPosition, GlyphFormat = Format_None, bool fetchMetricsOnly = false) const;
    Glyph *loadGlyphFor(glyph_t g, QFixed subPixelPosition, GlyphFormat format, const QTransform &t, bool fetchBoundingBox = false);

    QGlyphSet *loadGlyphSet(const QTransform &matrix);

    QFontEngineFT(const QFontDef &fd);
    virtual ~QFontEngineFT();

    bool init(FaceId faceId, bool antiaalias, GlyphFormat defaultFormat = Format_None,
              const QByteArray &fontData = QByteArray());
    bool init(FaceId faceId, bool antialias, GlyphFormat format,
              QFreetypeFace *freetypeFace);

    virtual int getPointInOutline(glyph_t glyph, int flags, quint32 point, QFixed *xpos, QFixed *ypos, quint32 *nPoints) Q_DECL_OVERRIDE;


    virtual void setDefaultHintStyle(HintStyle style) Q_DECL_OVERRIDE;

    virtual QFontEngine *cloneWithSize(qreal pixelSize) const Q_DECL_OVERRIDE;
    bool initFromFontEngine(const QFontEngineFT *fontEngine);

    HintStyle defaultHintStyle() const { return default_hint_style; }
protected:

    QFreetypeFace *freetype;
    mutable int default_load_flags;
    HintStyle default_hint_style;
    bool antialias;
    bool transform;
    bool embolden;
    bool obliquen;
    SubpixelAntialiasingType subpixelType;
    int lcdFilterType;
    bool embeddedbitmap;
    bool cacheEnabled;
    bool forceAutoHint;

private:
    friend class QFontEngineFTRawFont;
    friend class QFontconfigDatabase;
    friend class QBasicFontDatabase;
    friend class QFontEngineMultiFontConfig;

    int loadFlags(QGlyphSet *set, GlyphFormat format, int flags, bool &hsubpixel, int &vfactor) const;
    bool shouldUseDesignMetrics(ShaperFlags flags) const;

    GlyphFormat defaultFormat;
    FT_Matrix matrix;

    QList<QGlyphSet> transformedGlyphSets;
    mutable QGlyphSet defaultGlyphSet;

    QFontEngine::FaceId face_id;

    int xsize;
    int ysize;

    mutable QFixed lbearing;
    mutable QFixed rbearing;
    QFixed line_thickness;
    QFixed underline_position;

    FT_Size_Metrics metrics;
    mutable bool kerning_pairs_loaded;
};

inline uint qHash(const QFontEngineFT::GlyphAndSubPixelPosition &g)
{
    return (g.glyph << 8)  | (g.subPixelPosition * 10).round().toInt();
}

inline QFontEngineFT::Glyph *QFontEngineFT::QGlyphSet::getGlyph(glyph_t index, QFixed subPixelPosition) const
{
    if (useFastGlyphData(index, subPixelPosition))
        return fast_glyph_data[index];
    return glyph_data.value(GlyphAndSubPixelPosition(index, subPixelPosition));
}

extern FT_Library qt_getFreetype();

QT_END_NAMESPACE

#endif // QT_NO_FREETYPE

#endif // QFONTENGINE_FT_P_H