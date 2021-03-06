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
//   float4 g_LightScatteringColor;
//   float4 g_PowerGlossLevel;
//   float4 g_ShadowMapParams;
//   sampler2D g_ShadowMapSampler;
//   float4 g_Specular;
//   float4 g_TransColorMask;
//   sampler2D g_VerticalShadowMapSampler;
//   float4 g_aLightField[6];
//   float4 mrgEyeLight_Attribute;
//   float4 mrgEyeLight_Diffuse;
//   float4 mrgEyeLight_Range;
//   float4 mrgEyeLight_Specular;
//   float4 mrgGlobalLight_Diffuse;
//   float4 mrgGlobalLight_Direction;
//   float4 mrgGlobalLight_Specular;
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
//   float4 mrgTexcoordIndex[4];
//   sampler2D sampDif;
//
//
// Registers:
//
//   Name                       Reg   Size
//   -------------------------- ----- ----
//   mrgGlobalLight_Direction   c10      1
//   g_Diffuse                  c16      1
//   g_Ambient                  c17      1
//   g_Specular                 c18      1
//   g_PowerGlossLevel          c20      1
//   g_EyePosition              c22      1
//   g_EyeDirection             c23      1
//   mrgTexcoordIndex           c26      1
//   mrgGlobalLight_Diffuse     c36      1
//   mrgGlobalLight_Specular    c37      1
//   mrgLocalLight0_Position    c38      1
//   mrgLocalLight0_Color       c39      1
//   mrgLocalLight0_Range       c40      1
//   mrgLocalLight1_Position    c42      1
//   mrgLocalLight1_Color       c43      1
//   mrgLocalLight1_Range       c44      1
//   mrgLocalLight2_Position    c46      1
//   mrgLocalLight2_Color       c47      1
//   mrgLocalLight2_Range       c48      1
//   mrgLocalLight3_Position    c50      1
//   mrgLocalLight3_Color       c51      1
//   mrgLocalLight3_Range       c52      1
//   mrgEyeLight_Diffuse        c58      1
//   mrgEyeLight_Specular       c59      1
//   mrgEyeLight_Range          c60      1
//   mrgEyeLight_Attribute      c61      1
//   g_ShadowMapParams          c65      1
//   g_GI0Scale                 c70      1
//   g_LightScatteringColor     c75      1
//   g_aLightField              c77      6
//   g_ForceAlphaColor          c89      1
//   g_TransColorMask           c150     1
//   sampDif                    s0       1
//   g_VerticalShadowMapSampler s7       1
//   g_ShadowMapSampler         s13      1
//

    ps_3_0
    def c0, 0.5, 2, -1, 1024
    def c1, 500, 5, -2, 3
    def c2, 4, 0, 0, 0
    def c3, 0, 1, 2, 3
    dcl_texcoord v0
    dcl_texcoord1 v1
    dcl_texcoord2 v2.xyz
    dcl_texcoord3_pp v3
    dcl_texcoord4 v4
    dcl_texcoord6 v5
    dcl_texcoord5_pp v6.xyz
    dcl vFace
    dcl_2d s0
    dcl_2d s7
    dcl_2d s13
    frc r0.x, c26.x
    cmp r0.y, -r0.x, c3.x, c3.y
    add r0.x, -r0.x, c26.x
    mov r1.xy, c3
    cmp r0.y, c26.x, r1.x, r0.y
    add r0.x, r0.y, r0.x
    add r0, r0.x, -c3
    cmp r1.xz, -r0_abs.x, v0.xyyw, c3.x
    cmp r0.xy, -r0_abs.y, v0.zwzw, r1.xzzw
    cmp r0.xy, -r0_abs.z, v1, r0
    cmp r0.xy, -r0_abs.w, v1.zwzw, r0
    texld_pp r0, r0, s0
    add_pp r1.x, -c61.z, c61.y
    rcp_pp r1.x, r1.x
    add r2.xyz, -c22, v2
    dp3 r1.z, r2, r2
    rsq r1.z, r1.z
    mul_pp r2.xyz, r1.z, r2
    rcp r1.z, r1.z
    add r1.z, r1.z, -c60.z
    dp3_pp r1.w, r2, c23
    add_pp r1.w, r1.w, -c61.z
    mul_sat_pp r1.x, r1.x, r1.w
    mad_pp r1.w, r1.x, c1.z, c1.w
    mul_pp r1.x, r1.x, r1.x
    mul_pp r1.x, r1.x, r1.w
    pow_sat_pp r2.w, r1.x, c61.w
    add r1.x, r1.y, -c61.x
    cmp_pp r1.x, r1.x, c3.y, r2.w
    add r1.w, -c60.z, c60.w
    rcp r1.w, r1.w
    mul_sat r1.z, r1.w, r1.z
    add_pp r1.z, -r1.z, c3.y
    cmp_pp r1.y, -c61.x, r1.y, r1.z
    mul_pp r1.x, r1.x, r1.y
    mul_pp r1.yzw, c58.w, c58.xxyz
    mul r1.yzw, r1.x, r1
    add r2.w, -c48.z, c48.w
    rcp r2.w, r2.w
    add r3.xyz, -c46, v2
    dp3 r3.w, r3, r3
    rsq r3.w, r3.w
    rcp r4.x, r3.w
    mul_pp r3.xyz, r3.w, r3
    add r3.w, r4.x, -c48.z
    mul_sat r2.w, r2.w, r3.w
    add_pp r2.w, -r2.w, c3.y
    mul r4.xyz, r2.w, c47
    add r2.w, -c44.z, c44.w
    rcp r2.w, r2.w
    add r5.xyz, -c42, v2
    dp3 r3.w, r5, r5
    rsq r3.w, r3.w
    rcp r4.w, r3.w
    mul_pp r5.xyz, r3.w, r5
    add r3.w, r4.w, -c44.z
    mul_sat r2.w, r2.w, r3.w
    add_pp r2.w, -r2.w, c3.y
    mul r6.xyz, r2.w, c43
    max r2.w, v4.z, c3.x
    add r3.w, r2.w, -v4.w
    cmp r7.z, r3.w, c3.x, r2.w
    mov r7.xyw, v4
    texldp_pp r7, r7, s13
    max r2.w, v5.z, c3.x
    add r3.w, r2.w, -v5.w
    cmp r8.z, r3.w, c3.x, r2.w
    mov r8.xyw, v5
    texldp_pp r8, r8, s7
    min_pp r2.w, r8.x, r7.x
    lrp_pp r3.w, v6.z, c3.y, r8.x
    lrp_pp r4.w, v6.z, c3.y, r2.w
    rcp r2.w, v4.w
    mul r7.xy, r2.w, v4
    mad r7.xy, r7, c0.y, c0.z
    abs_sat r7.xy, r7
    add_sat r7.xy, r7, -c65.x
    mul r7.xy, r7, c65.y
    max r2.w, r7.x, r7.y
    lrp_pp r5.w, r2.w, c3.y, r4.w
    lrp_pp r4.w, r2.w, c3.y, r3.w
    mul_pp r2.w, r5.w, c77.w
    mul r7.xyz, r2.w, c36
    mul r8.xyz, r2.w, c37
    add r2.w, -c40.z, c40.w
    rcp r2.w, r2.w
    add r9.xyz, -c38, v2
    dp3 r3.w, r9, r9
    rsq r3.w, r3.w
    rcp r5.w, r3.w
    mul_pp r9.xyz, r3.w, r9
    add r3.w, r5.w, -c40.z
    mul_sat r2.w, r2.w, r3.w
    add_pp r2.w, -r2.w, c3.y
    mul r10.xyz, r2.w, c39
    cmp_pp r11.xyz, vFace, v3, -v3
    nrm_pp r12.xyz, r11
    dp3_pp r2.w, r12, -r9
    mov_sat_pp r3.w, r2.w
    mov_sat_pp r2.w, -r2.w
    mul r11.xyz, r2.w, r10
    mul r10.xyz, r3.w, r10
    dp3_pp r2.w, r12, -c10
    mov_sat_pp r3.w, r2.w
    mov_sat_pp r2.w, -r2.w
    mad_pp r11.xyz, r7, r2.w, r11
    mad_pp r7.xyz, r7, r3.w, r10
    mul r8.xyz, r3.w, r8
    dp3_pp r2.w, r12, -r5
    mov_sat_pp r3.w, r2.w
    mov_sat_pp r2.w, -r2.w
    mad_pp r11.xyz, r6, r2.w, r11
    mad_pp r7.xyz, r6, r3.w, r7
    mul r6.xyz, r3.w, r6
    dp3_pp r2.w, r12, -r3
    mov_sat_pp r3.w, r2.w
    mov_sat_pp r2.w, -r2.w
    mad_pp r11.xyz, r4, r2.w, r11
    mad_pp r7.xyz, r4, r3.w, r7
    mul r4.xyz, r3.w, r4
    add r2.w, -c52.z, c52.w
    rcp r2.w, r2.w
    add r13.xyz, -c50, v2
    dp3 r3.w, r13, r13
    rsq r3.w, r3.w
    rcp r5.w, r3.w
    mul_pp r13.xyz, r3.w, r13
    add r3.w, r5.w, -c52.z
    mul_sat r2.w, r2.w, r3.w
    add_pp r2.w, -r2.w, c3.y
    mul r14.xyz, r2.w, c51
    dp3_pp r2.w, r12, -r13
    mov_sat_pp r3.w, r2.w
    mov_sat_pp r2.w, -r2.w
    mad_pp r11.xyz, r14, r2.w, r11
    mad_pp r7.xyz, r14, r3.w, r7
    mul r14.xyz, r3.w, r14
    dp3_pp r2.w, r12, -r2
    mov_sat_pp r3.w, r2.w
    mov_sat_pp r2.w, -r2.w
    mad_pp r11.xyz, r1.yzww, r2.w, r11
    mad_pp r1.yzw, r1, r3.w, r7.xxyz
    mul_pp r7.xyz, r11, c16
    mul_pp r7.xyz, r0, r7
    mul r7.xyz, r7, c150
    mov r11.xyz, c79
    add r11.xyz, -r11, c80
    mad_pp r15.xyz, r12, c0.x, c0.x
    mad r11.xyz, r15.y, r11, c79
    mul_pp r16.xyz, r12, r12
    mul r11.xyz, r11, r16.y
    mov r17.xyz, c77
    add r17.xyz, -r17, c78
    mad r15.xyw, r15.x, r17.xyzz, c77.xyzz
    mad_pp r11.xyz, r16.x, r15.xyww, r11
    mov r17.xyz, c81
    add r15.xyw, -r17.xyzz, c82.xyzz
    mad r15.xyz, r15.z, r15.xyww, c81
    mad_pp r11.xyz, r16.z, r15, r11
    mul_pp r15.xyz, r11, c17
    mul r15.xyz, r15, c70.w
    mad r11.xyz, r11, c17, -r15
    mad_pp r11.xyz, r4.w, r11, r15
    mad_pp r1.yzw, r1, c16.xxyz, r11.xxyz
    mad_pp r0.xyz, r1.yzww, r0, r7
    mul_pp r7.w, r0.w, c16.w
    add_pp r1.yzw, c22.xxyz, -v2.xxyz
    dp3_pp r0.w, r1.yzww, r1.yzww
    rsq_pp r0.w, r0.w
    mad_pp r9.xyz, r1.yzww, r0.w, -r9
    nrm_pp r11.xyz, r9
    dp3_sat_pp r2.w, r11, r12
    mov_pp r9.xy, c1
    mul_pp r9.xy, r9, c20.yzzw
    max_pp r4.w, r9.x, c3.y
    mul_pp r9.xyz, r9.y, c18
    min r5.w, r4.w, c0.w
    pow_pp r4.w, r2.w, r5.w
    mul r10.xyz, r4.w, r10
    mad_pp r11.xyz, r1.yzww, r0.w, -c10
    nrm_pp r15.xyz, r11
    dp3_sat_pp r2.w, r15, r12
    pow_pp r4.w, r2.w, r5.w
    mad_pp r8.xyz, r8, r4.w, r10
    mad_pp r5.xyz, r1.yzww, r0.w, -r5
    nrm_pp r10.xyz, r5
    dp3_sat_pp r2.w, r10, r12
    pow_pp r4.w, r2.w, r5.w
    mad_pp r5.xyz, r6, r4.w, r8
    mad_pp r3.xyz, r1.yzww, r0.w, -r3
    nrm_pp r6.xyz, r3
    dp3_sat_pp r2.w, r6, r12
    pow_pp r3.x, r2.w, r5.w
    mad_pp r3.xyz, r4, r3.x, r5
    mad_pp r4.xyz, r1.yzww, r0.w, -r13
    mad_pp r1.yzw, r1, r0.w, -r2.xxyz
    nrm_pp r2.xyz, r1.yzww
    dp3_sat_pp r0.w, r2, r12
    pow_pp r1.y, r0.w, r5.w
    nrm_pp r2.xyz, r4
    dp3_sat_pp r0.w, r2, r12
    pow_pp r1.z, r0.w, r5.w
    mad_pp r2.xyz, r14, r1.z, r3
    mul_pp r3.xyz, c59.w, c59
    mul r1.xzw, r1.x, r3.xyyz
    mul r1.xzw, r3.w, r1
    mad_pp r1.xyz, r1.xzww, r1.y, r2
    mul_pp r1.xyz, r9, r1
    mad_pp r7.xyz, r1, v3.w, r0
    mul_pp r0, r7, c89
    min_pp r1, r0, c2.x
    mul_pp r0.xyz, c75, v6.y
    mad_pp oC0.xyz, r1, v6.x, r0
    mov_pp oC0.w, r1.w

// approximately 242 instruction slots used (3 texture, 239 arithmetic)
