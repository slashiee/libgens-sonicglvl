//
// Generated by Microsoft (R) HLSL Shader Compiler 9.29.952.3111
//
// Parameters:
//
//   float4 g_Ambient;
//   float4 g_Diffuse;
//   float4 g_EyeDirection;
//   float4 g_EyePosition;
//   float4 g_ForceAlphaColor;
//   sampler2D g_FramebufferSampler;
//   float4 g_GI0Scale;
//   float4 g_GI1Scale;
//   sampler2D g_GISampler;
//   float4 g_LightScatteringColor;
//   row_major float4x4 g_MtxView;
//   float4 g_OpacityReflectionRefractionSpectype;
//   float4 g_PowerGlossLevel;
//   float4 g_ShadowMapParams;
//   sampler2D g_ShadowMapSampler;
//   float4 g_Specular;
//   float4 g_ViewportSize;
//   float4 mrgEyeLight_Attribute;
//   float4 mrgEyeLight_Diffuse;
//   float4 mrgEyeLight_Range;
//   float4 mrgEyeLight_Specular;
//   float4 mrgGlobalLight_Diffuse;
//   float4 mrgGlobalLight_Direction;
//   float4 mrgGlobalLight_Specular;
//   float4 mrgInShadowScale;
//   float4 mrgLocalLight0_Color;
//   float4 mrgLocalLight0_Position;
//   float4 mrgLocalLight0_Range;
//   float4 mrgLocalLight1_Color;
//   float4 mrgLocalLight1_Position;
//   float4 mrgLocalLight1_Range;
//   float4 mrgLocalLight2_Color;
//   float4 mrgLocalLight2_Position;
//   float4 mrgLocalLight2_Range;
//   float4 mrgLocalLight3_Color;
//   float4 mrgLocalLight3_Position;
//   float4 mrgLocalLight3_Range;
//   float4 mrgLuminanceRange;
//   sampler2D sampDif;
//   sampler2D sampEnv;
//   sampler2D sampNrm;
//   sampler2D sampSpe;
//
//
// Registers:
//
//   Name                                  Reg   Size
//   ------------------------------------- ----- ----
//   mrgGlobalLight_Direction              c10      1
//   g_Diffuse                             c16      1
//   g_Ambient                             c17      1
//   g_Specular                            c18      1
//   g_PowerGlossLevel                     c20      1
//   g_OpacityReflectionRefractionSpectype c21      1
//   g_EyePosition                         c22      1
//   g_EyeDirection                        c23      1
//   g_ViewportSize                        c24      1
//   mrgGlobalLight_Diffuse                c36      1
//   mrgGlobalLight_Specular               c37      1
//   mrgLocalLight0_Position               c38      1
//   mrgLocalLight0_Color                  c39      1
//   mrgLocalLight0_Range                  c40      1
//   mrgLocalLight1_Position               c42      1
//   mrgLocalLight1_Color                  c43      1
//   mrgLocalLight1_Range                  c44      1
//   mrgLocalLight2_Position               c46      1
//   mrgLocalLight2_Color                  c47      1
//   mrgLocalLight2_Range                  c48      1
//   mrgLocalLight3_Position               c50      1
//   mrgLocalLight3_Color                  c51      1
//   mrgLocalLight3_Range                  c52      1
//   mrgEyeLight_Diffuse                   c58      1
//   mrgEyeLight_Specular                  c59      1
//   mrgEyeLight_Range                     c60      1
//   mrgEyeLight_Attribute                 c61      1
//   mrgLuminanceRange                     c63      1
//   mrgInShadowScale                      c64      1
//   g_ShadowMapParams                     c65      1
//   g_GI0Scale                            c70      1
//   g_GI1Scale                            c71      1
//   g_LightScatteringColor                c75      1
//   g_ForceAlphaColor                     c89      1
//   g_MtxView                             c90      3
//   sampDif                               s0       1
//   sampSpe                               s1       1
//   sampNrm                               s3       1
//   sampEnv                               s4       1
//   g_GISampler                           s10      1
//   g_FramebufferSampler                  s11      1
//   g_ShadowMapSampler                    s13      1
//

    ps_3_0
    def c0, 0.298900008, 0.586600006, 0.114399999, 1024
    def c1, -2, 3, 500, 5
    def c2, 2, -1, 1, 0
    def c3, 0.5, -0.5, 0.0500000007, 4
    dcl_texcoord v0
    dcl_texcoord2 v1.xyz
    dcl_texcoord3_pp v2
    dcl_texcoord4 v3
    dcl_texcoord5_pp v4.xyz
    dcl_texcoord7 v5.xyz
    dcl_texcoord8 v6.xyz
    dcl_color_pp v7
    dcl vPos.xy
    dcl_2d s0
    dcl_2d s1
    dcl_2d s3
    dcl_2d s4
    dcl_2d s10
    dcl_2d s11
    dcl_2d s13
    add_pp r0.x, -c61.z, c61.y
    rcp_pp r0.x, r0.x
    add r0.yzw, -c22.xxyz, v1.xxyz
    dp3 r1.x, r0.yzww, r0.yzww
    rsq r1.x, r1.x
    mul_pp r0.yzw, r0, r1.x
    rcp r1.x, r1.x
    add r1.x, r1.x, -c60.z
    dp3_pp r1.y, r0.yzww, c23
    add_pp r1.y, r1.y, -c61.z
    mul_sat_pp r0.x, r0.x, r1.y
    mad_pp r1.y, r0.x, c1.x, c1.y
    mul_pp r0.x, r0.x, r0.x
    mul_pp r0.x, r0.x, r1.y
    pow_sat_pp r1.y, r0.x, c61.w
    mov_pp r2.yz, c2
    add r0.x, r2.z, -c61.x
    cmp_pp r0.x, r0.x, c2.z, r1.y
    add r1.y, -c60.z, c60.w
    rcp r1.y, r1.y
    mul_sat r1.x, r1.y, r1.x
    add_pp r1.x, -r1.x, c2.z
    cmp_pp r1.x, -c61.x, r2.z, r1.x
    mul_pp r0.x, r0.x, r1.x
    add r1.x, -c52.z, c52.w
    rcp r1.x, r1.x
    add r1.yzw, -c50.xxyz, v1.xxyz
    dp3 r2.x, r1.yzww, r1.yzww
    rsq r2.x, r2.x
    rcp r2.z, r2.x
    mul_pp r1.yzw, r1, r2.x
    add r2.x, r2.z, -c52.z
    mul_sat r1.x, r1.x, r2.x
    add_pp r1.x, -r1.x, c2.z
    add r2.x, -c48.z, c48.w
    rcp r2.x, r2.x
    add r3.xyz, -c46, v1
    dp3 r2.z, r3, r3
    rsq r2.z, r2.z
    rcp r2.w, r2.z
    mul_pp r3.xyz, r2.z, r3
    add r2.z, r2.w, -c48.z
    mul_sat r2.x, r2.x, r2.z
    add r2.z, -c40.z, c40.w
    rcp r2.z, r2.z
    add r4.xyz, -c38, v1
    dp3 r2.w, r4, r4
    rsq r2.w, r2.w
    rcp r3.w, r2.w
    mul_pp r4.xyz, r2.w, r4
    add r2.w, r3.w, -c40.z
    mul_sat r2.z, r2.z, r2.w
    add r2.w, -c44.z, c44.w
    rcp r2.w, r2.w
    add r5.xyz, -c42, v1
    dp3 r3.w, r5, r5
    rsq r3.w, r3.w
    rcp r4.w, r3.w
    mul_pp r5.xyz, r3.w, r5
    add r3.w, r4.w, -c44.z
    mul_sat r2.w, r2.w, r3.w
    add_pp r2.xzw, -r2, c2.z
    nrm_pp r6.xyz, v6
    texld_pp r7, v0, s3
    mul_pp r7.x, r7.w, r7.x
    mad_pp r7.xy, r7, c2.x, c2.y
    mul_pp r6.xyz, r6, r7.y
    nrm_pp r8.xyz, v5
    mad_pp r6.xyz, r7.x, r8, r6
    dp2add_pp r3.w, r7, -r7, c2.z
    rsq_pp r3.w, r3.w
    rcp_pp r3.w, r3.w
    nrm_pp r7.xyz, v2
    mad_pp r6.xyz, r3.w, r7, r6
    add_pp r7.xyz, c22, -v1
    dp3_pp r3.w, r7, r7
    rsq_pp r3.w, r3.w
    mad_pp r8.xyz, r7, r3.w, -r5
    dp3_pp r4.w, r6, -r5
    nrm_pp r5.xyz, r8
    dp3_sat_pp r5.x, r5, r6
    mov_pp r5.zw, c1
    mul_pp r5.yz, r5.xzww, c20
    max_pp r6.w, r5.y, c2.z
    min r5.y, r6.w, c0.w
    pow r6.w, r5.x, r5.y
    mul_pp r8.xyz, r5.z, c43
    mul_pp r8.xyz, r6.w, r8
    mul_pp r8.xyz, r2.w, r8
    mad_pp r9.xyz, r7, r3.w, -r4
    dp3_pp r4.x, r6, -r4
    nrm_pp r10.xyz, r9
    dp3_sat_pp r4.y, r10, r6
    pow r6.w, r4.y, r5.y
    mul_pp r9.xyz, r5.z, c39
    mul_pp r9.xyz, r6.w, r9
    mad_pp r8.xyz, r2.z, r9, r8
    mad_pp r9.xyz, r7, r3.w, -r3
    dp3_pp r3.x, r6, -r3
    nrm_pp r10.xyz, r9
    dp3_sat_pp r3.y, r10, r6
    pow r4.y, r3.y, r5.y
    mul_pp r9.xyz, r5.z, c47
    mul_pp r9.xyz, r4.y, r9
    mad_pp r8.xyz, r2.x, r9, r8
    mad_pp r9.xyz, r7, r3.w, -r1.yzww
    dp3_pp r1.y, r6, -r1.yzww
    nrm_pp r10.xyz, r9
    dp3_sat_pp r1.z, r10, r6
    pow r3.y, r1.z, r5.y
    mul_pp r9.xyz, r5.z, c51
    mul_pp r9.xyz, r3.y, r9
    mad_pp r8.xyz, r1.x, r9, r8
    rcp r1.z, v3.w
    mul r1.zw, r1.z, v3.xyxy
    mad r1.zw, r1, c2.x, c2.y
    abs_sat r1.zw, r1
    add_sat r1.zw, r1, -c65.x
    mul r1.zw, r1, c65.y
    max r3.y, r1.z, r1.w
    max r1.z, v3.z, c2.w
    add r1.w, r1.z, -v3.w
    cmp r9.z, r1.w, c2.w, r1.z
    mov r9.xyw, v3
    texldp_pp r9, r9, s13
    lrp_pp r1.z, v4.z, c2.z, r9.x
    lrp_pp r4.y, r3.y, c2.z, r1.z
    texld_pp r9, v0.zwzw, s10
    mul r1.z, r4.y, r9.w
    mul_pp r10.xyz, r5.z, c37
    mad_pp r11.xyz, r7, r3.w, -c10
    mad_pp r3.yzw, r7.xxyz, r3.w, -r0
    dp3_pp r0.y, r6, -r0.yzww
    nrm_pp r7.xyz, r3.yzww
    dp3_sat_pp r0.z, r7, r6
    pow r1.w, r0.z, r5.y
    nrm_pp r7.xyz, r11
    dp3_sat_pp r0.z, r7, r6
    pow r3.y, r0.z, r5.y
    mul_pp r3.yzw, r3.y, r10.xxyz
    mad_pp r3.yzw, r3, r1.z, r8.xxyz
    mul_pp r5.xyw, c59.w, c59.xyzz
    mul_pp r5.xyz, r5.z, r5.xyww
    mul_pp r5.xyz, r1.w, r5
    mad_pp r3.yzw, r0.x, r5.xxyz, r3
    mul r5, r6.y, c91
    mad r5, r6.x, c90, r5
    mad r5, r6.z, c92, r5
    dp3_pp r0.z, r6, -c10
    dp4 r0.w, r5, r5
    rsq r0.w, r0.w
    mul r5.zw, r0.w, r5.xyxy
    mad_pp r5.zw, r5, c3.xyxy, c3.x
    texld_pp r6, r5.zwzw, s4
    mul r7.xyz, r6, c63.x
    mad_pp r6.xyz, r7, r6.w, r6
    texld_pp r7, v0, s1
    mul_pp r6.xyz, r6, r7.w
    mul r0.w, c64.z, c64.x
    mov r8.xz, c64
    mad r1.w, r8.x, -r8.z, r8.z
    mad_pp r0.w, r1.z, r1.w, r0.w
    mul_pp r6.xyz, r0.w, r6
    mad_pp r3.yzw, r3, c18.xxyz, r6.xxyz
    mul_pp r3.yzw, r7.xxyz, r3
    mul_pp r3.yzw, r3, v2.w
    mul_pp r6.xyz, r4.w, c43
    cmp_pp r6.xyz, r4.w, r6, c2.w
    mul_pp r6.xyz, r2.w, r6
    mul_pp r7.xyz, r4.x, c39
    cmp_pp r4.xzw, r4.x, r7.xyyz, c2.w
    mad_pp r4.xzw, r2.z, r4, r6.xyyz
    mul_pp r6.xyz, r3.x, c47
    cmp_pp r6.xyz, r3.x, r6, c2.w
    mad_pp r2.xzw, r2.x, r6.xyyz, r4
    mul_pp r4.xzw, r1.y, c51.xyyz
    cmp_pp r4.xzw, r1.y, r4, c2.w
    mad_pp r1.xyw, r1.x, r4.xzzw, r2.xzzw
    mul r2.xzw, r0.z, c36.xyyz
    mul_pp r2.xzw, r1.z, r2
    cmp_pp r2.xzw, r0.z, r2, c2.w
    add_pp r1.xyz, r1.xyww, r2.xzww
    mul_pp r2.xzw, c58.w, c58.xyyz
    mul_pp r2.xzw, r0.y, r2
    cmp_pp r0.yzw, r0.y, r2.xxzw, c2.w
    mad_pp r0.xyz, r0.x, r0.yzww, r1
    mul_pp r1.xyz, r9, r9
    dp3_pp r0.w, r1, c0
    mad_pp r1.xyz, r9, r9, -r0.w
    mad_sat_pp r1.xyz, r1, c71.w, r0.w
    mul_pp r1.xyz, r1, c70
    mul_pp r2.xzw, r1.xyyz, c17.xyyz
    mul r2.xzw, r2, c70.w
    mad r1.xyz, r1, c17, -r2.xzww
    mad_pp r1.xyz, r4.y, r1, r2.xzww
    add_pp r0.xyz, r0, r1
    mul_pp r0.xyz, r0, c16
    texld_pp r1, v0, s0
    mad_pp r0.xyz, r0, r1, r3.yzww
    mul_pp r0.w, r1.w, c16.w
    mul_pp r0.w, r0.w, v7.w
    mul_pp r1.w, r0.w, c21.x
    mul r0.w, c24.w, vPos.y
    mad_pp r3.y, r0.w, -c2.x, -c2.y
    dp2add_pp r3.x, vPos.x, c24.z, r2.y
    mad_pp r2.xy, r5, c3.z, r3
    mad r2.xy, r2, c3, c3.x
    texld_pp r2, r2, s11
    add_pp r0.xyz, r0, r2
    mul_pp r1.xyz, r0, v7
    mul_pp r0, r1, c89
    min_pp r1, r0, c3.w
    mul_pp r0.xyz, c75, v4.y
    mad_pp oC0.xyz, r1, v4.x, r0
    mov_pp oC0.w, r1.w

// approximately 249 instruction slots used (7 texture, 242 arithmetic)