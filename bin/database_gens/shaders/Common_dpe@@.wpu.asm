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
//   float4 g_GI0Scale;
//   float4 g_GI1Scale;
//   sampler2D g_GISampler;
//   float4 g_LightScatteringColor;
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
//   float4 mrgPlayableParam;
//   float4 mrgTexcoordIndex[4];
//   sampler2D sampDif;
//   sampler2D sampEnv;
//   sampler2D sampPow;
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
//   mrgTexcoordIndex                      c26      1
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
//   mrgPlayableParam                      c86      1
//   g_ForceAlphaColor                     c89      1
//   sampDif                               s0       1
//   sampPow                               s2       1
//   sampEnv                               s5       1
//   g_GISampler                           s10      1
//   g_ShadowMapSampler                    s13      1
//

    ps_3_0
    def c0, 0.5, 0.298900008, 0.586600006, 0.114399999
    def c1, 500, 5, 1024, 0.25
    def c2, 2, -1, -2, 3
    def c3, 4, 0, 0, 0
    def c4, 0, 1, 2, 3
    def c5, -1, 1, 0, 0.5
    dcl_texcoord v0
    dcl_texcoord1 v1
    dcl_texcoord2 v2.xyz
    dcl_texcoord3_pp v3
    dcl_texcoord4 v4
    dcl_texcoord5_pp v5.xyz
    dcl_color_pp v6
    dcl vPos.y
    dcl_2d s0
    dcl_2d s2
    dcl_2d s5
    dcl_2d s10
    dcl_2d s13
    add_pp r0.x, -c61.z, c61.y
    rcp_pp r0.x, r0.x
    add r0.yzw, -c22.xxyz, v2.xxyz
    dp3 r1.x, r0.yzww, r0.yzww
    rsq r1.x, r1.x
    mul_pp r0.yzw, r0, r1.x
    rcp r1.x, r1.x
    add r1.x, r1.x, -c60.z
    dp3_pp r1.y, r0.yzww, c23
    add_pp r1.y, r1.y, -c61.z
    mul_sat_pp r0.x, r0.x, r1.y
    mad_pp r1.y, r0.x, c2.z, c2.w
    mul_pp r0.x, r0.x, r0.x
    mul_pp r0.x, r0.x, r1.y
    pow_sat_pp r1.y, r0.x, c61.w
    mov r2.xy, c4
    add r0.x, r2.y, -c61.x
    cmp_pp r0.x, r0.x, c4.y, r1.y
    add r1.y, -c60.z, c60.w
    rcp r1.y, r1.y
    mul_sat r1.x, r1.y, r1.x
    add_pp r1.x, -r1.x, c4.y
    cmp_pp r1.x, -c61.x, r2.y, r1.x
    mul_pp r0.x, r0.x, r1.x
    add r1.x, -c52.z, c52.w
    rcp r1.x, r1.x
    add r1.yzw, -c50.xxyz, v2.xxyz
    dp3 r2.y, r1.yzww, r1.yzww
    rsq r2.y, r2.y
    rcp r2.z, r2.y
    mul_pp r1.yzw, r1, r2.y
    add r2.y, r2.z, -c52.z
    mul_sat r1.x, r1.x, r2.y
    add_pp r1.x, -r1.x, c4.y
    add r2.y, -c48.z, c48.w
    rcp r2.y, r2.y
    add r3.xyz, -c46, v2
    dp3 r2.z, r3, r3
    rsq r2.z, r2.z
    rcp r2.w, r2.z
    mul_pp r3.xyz, r2.z, r3
    add r2.z, r2.w, -c48.z
    mul_sat r2.y, r2.y, r2.z
    add r2.z, -c40.z, c40.w
    rcp r2.z, r2.z
    add r4.xyz, -c38, v2
    dp3 r2.w, r4, r4
    rsq r2.w, r2.w
    rcp r3.w, r2.w
    mul_pp r4.xyz, r2.w, r4
    add r2.w, r3.w, -c40.z
    mul_sat r2.z, r2.z, r2.w
    add r2.w, -c44.z, c44.w
    rcp r2.w, r2.w
    add r5.xyz, -c42, v2
    dp3 r3.w, r5, r5
    rsq r3.w, r3.w
    rcp r4.w, r3.w
    mul_pp r5.xyz, r3.w, r5
    add r3.w, r4.w, -c44.z
    mul_sat r2.w, r2.w, r3.w
    add_pp r2.yzw, -r2, c4.y
    frc r6.xy, c26.xwzw
    cmp r6.zw, -r6.xyxy, c4.x, c4.y
    add r6.xy, -r6, c26.xwzw
    cmp r6.zw, c26.xyxw, r2.x, r6
    add r6.xy, r6.zwzw, r6
    add r7, r6.y, -c4
    add r6, r6.x, -c4
    cmp r8.xy, -r7_abs.x, v0, c4.x
    cmp r7.xy, -r7_abs.y, v0.zwzw, r8
    cmp r7.xy, -r7_abs.z, v1, r7
    cmp r7.xy, -r7_abs.w, v1.zwzw, r7
    texld_pp r7, r7, s2
    mul_pp r7.yz, r7.x, c20
    mul_pp r7.yz, r7, c1.xxyw
    mul_pp r8.xyz, r7.z, c43
    max_pp r2.x, r7.y, c4.y
    min r3.w, r2.x, c1.z
    add_pp r9, c22.xyzx, -v2.xyzx
    dp3_pp r2.x, r9.yzww, r9.yzww
    rsq_pp r2.x, r2.x
    mad_pp r10.xyz, r9, r2.x, -r5
    nrm_pp r11.xyz, r10
    nrm r10, v3.xyzx
    dp3_sat_pp r4.w, r11, r10
    pow r5.w, r4.w, r3.w
    mul_pp r8.xyz, r5.w, r8
    mul_pp r8.xyz, r2.w, r8
    mul_pp r11.xyz, r7.z, c39
    mad_pp r12.xyz, r9, r2.x, -r4
    dp3_pp r4.x, r10.wyzw, -r4
    nrm_pp r13.xyz, r12
    dp3_sat_pp r4.y, r13, r10
    pow r5.w, r4.y, r3.w
    mul_pp r4.yzw, r5.w, r11.xxyz
    mad_pp r4.yzw, r2.z, r4, r8.xxyz
    mul_pp r8.xyz, r7.z, c47
    mad_pp r11.xyz, r9, r2.x, -r3
    dp3_pp r3.x, r10.wyzw, -r3
    nrm_pp r12.xyz, r11
    dp3_sat_pp r3.y, r12, r10
    pow r5.w, r3.y, r3.w
    mul_pp r8.xyz, r5.w, r8
    mad_pp r4.yzw, r2.y, r8.xxyz, r4
    mul_pp r8.xyz, r7.z, c51
    mad_pp r11.xyz, r9, r2.x, -r1.yzww
    dp3_pp r1.y, r10.wyzw, -r1.yzww
    nrm_pp r12.xyz, r11
    dp3_sat_pp r1.z, r12, r10
    pow r5.w, r1.z, r3.w
    mul_pp r8.xyz, r5.w, r8
    mad_pp r4.yzw, r1.x, r8.xxyz, r4
    rcp r1.z, v4.w
    mul r1.zw, r1.z, v4.xyxy
    mad r1.zw, r1, c2.x, c2.y
    abs_sat r1.zw, r1
    add_sat r1.zw, r1, -c65.x
    mul r1.zw, r1, c65.y
    max r3.y, r1.z, r1.w
    max r1.z, v4.z, c4.x
    add r1.w, r1.z, -v4.w
    cmp r8.z, r1.w, c4.x, r1.z
    mov r8.xyw, v4
    texldp_pp r8, r8, s13
    lrp_pp r1.z, v5.z, c4.y, r8.x
    lrp_pp r5.w, r3.y, c4.y, r1.z
    texld_pp r8, v0.zwzw, s10
    mul r1.z, r5.w, r8.w
    mul_pp r11.xyz, r7.z, c37
    mad_pp r12.xyz, r9, r2.x, -c10
    nrm_pp r13.xyz, r12
    dp3_sat_pp r1.w, r13, r10
    pow r7.y, r1.w, r3.w
    mul_pp r11.xyz, r7.y, r11
    mad_pp r4.yzw, r11.xxyz, r1.z, r4
    mul_pp r11.xyz, c59.w, c59
    mul_pp r7.yzw, r7.z, r11.xxyz
    mad_pp r11.xyz, r9, r2.x, -r0.yzww
    dp3_pp r0.y, r10.wyzw, -r0.yzww
    mul r9, r2.x, r9
    nrm_pp r12.xyz, r11
    dp3_sat_pp r0.z, r12, r10
    pow r1.w, r0.z, r3.w
    mul_pp r3.yzw, r1.w, r7
    mad_pp r3.yzw, r0.x, r3, r4
    dp3 r0.z, r9.yzww, r10.yzww
    add r0.z, r0.z, r0.z
    mad r9, r0.z, r10, -r9
    mad r11, r9.wyzw, c5.xxyz, c5.zzzw
    mul r12, r9, c5.yxxz
    cmp r9, r9.z, r11, r12
    add r0.z, r9.z, c4.y
    rcp r0.z, r0.z
    mad r0.zw, r9.xyyx, r0.z, c4.y
    mad_pp r9.x, r0.w, c1.w, r9.w
    mul_pp r9.y, r0.z, c0.x
    texld_pp r9, r9, s5
    mul r4.yzw, r9.xxyz, c63.x
    mad_pp r4.yzw, r4, r9.w, r9.xxyz
    mul_pp r4.yzw, r7.x, r4
    mul r0.z, c64.z, c64.x
    mov r7.xz, c64
    mad r0.w, r7.x, -r7.z, r7.z
    mad_pp r0.z, r1.z, r0.w, r0.z
    mul_pp r4.yzw, r0.z, r4
    mad_pp r3.yzw, r3, c18.xxyz, r4
    mul_pp r3.yzw, r3, v3.w
    cmp r0.zw, -r6_abs.x, v0.xyxy, c4.x
    cmp r0.zw, -r6_abs.y, v0, r0
    cmp r0.zw, -r6_abs.z, v1.xyxy, r0
    cmp r0.zw, -r6_abs.w, v1, r0
    texld_pp r6, r0.zwzw, s0
    mul_pp r0.z, r6.w, c16.w
    mul_pp r0.z, r0.z, v6.w
    mul_pp r7.w, r0.z, c21.x
    add r0.z, c0.x, vPos.y
    mov r2.x, c86.x
    mad r0.z, r0.z, c24.w, -r2.x
    mul_sat_pp r0.z, r0.z, c86.y
    lrp_pp r4.yzw, r0.z, r6.xxyz, c4.y
    dp3_pp r0.z, r10.wyzw, -r5
    dp3_pp r0.w, r10.wyzw, -c10
    mul_pp r5.xyz, r0.z, c43
    cmp_pp r5.xyz, r0.z, r5, c4.x
    mul_pp r5.xyz, r2.w, r5
    mul_pp r6.xyz, r4.x, c39
    cmp_pp r6.xyz, r4.x, r6, c4.x
    mad_pp r2.xzw, r2.z, r6.xyyz, r5.xyyz
    mul_pp r5.xyz, r3.x, c47
    cmp_pp r5.xyz, r3.x, r5, c4.x
    mad_pp r2.xyz, r2.y, r5, r2.xzww
    mul_pp r5.xyz, r1.y, c51
    cmp_pp r5.xyz, r1.y, r5, c4.x
    mad_pp r1.xyw, r1.x, r5.xyzz, r2.xyzz
    mul r2.xyz, r0.w, c36
    mul_pp r2.xyz, r1.z, r2
    cmp_pp r2.xyz, r0.w, r2, c4.x
    add_pp r1.xyz, r1.xyww, r2
    mul_pp r2.xyz, c58.w, c58
    mul_pp r2.xyz, r0.y, r2
    cmp_pp r0.yzw, r0.y, r2.xxyz, c4.x
    mad_pp r0.xyz, r0.x, r0.yzww, r1
    mul_pp r1.xyz, r8, r8
    dp3_pp r0.w, r1, c0.yzww
    mad_pp r1.xyz, r8, r8, -r0.w
    mad_sat_pp r1.xyz, r1, c71.w, r0.w
    mul_pp r1.xyz, r1, c70
    mul_pp r2.xyz, r1, c17
    mul r2.xyz, r2, c70.w
    mad r1.xyz, r1, c17, -r2
    mad_pp r1.xyz, r5.w, r1, r2
    add_pp r0.xyz, r0, r1
    mul_pp r0.xyz, r0, c16
    mad_pp r0.xyz, r0, r4.yzww, r3.yzww
    mul_pp r7.xyz, r0, v6
    mul_pp r0, r7, c89
    min_pp r1, r0, c3.x
    mul_pp r0.xyz, c75, v5.y
    mad_pp oC0.xyz, r1, v5.x, r0
    mov_pp oC0.w, r1.w

// approximately 249 instruction slots used (5 texture, 244 arithmetic)
