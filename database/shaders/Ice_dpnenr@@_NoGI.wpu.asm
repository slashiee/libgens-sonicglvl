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
//   float4 g_LightScatteringColor;
//   float4 g_PowerGlossLevel;
//   float4 g_ShadowMapParams;
//   sampler2D g_ShadowMapSampler;
//   float4 g_Specular;
//   sampler2D g_VerticalShadowMapSampler;
//   float4 g_aLightField[6];
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
//   float4 mrgTexcoordIndex[4];
//   sampler2D sampDif;
//   sampler2D sampEnv;
//   sampler2D sampNrm0;
//   sampler2D sampNrm1;
//   sampler2D sampPower;
//   sampler2D sampRef;
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
//   mrgTexcoordIndex           c26      2
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
//   mrgLuminanceRange          c63      1
//   mrgInShadowScale           c64      1
//   g_ShadowMapParams          c65      1
//   g_LightScatteringColor     c75      1
//   g_aLightField              c77      6
//   g_ForceAlphaColor          c89      1
//   sampDif                    s0       1
//   sampPower                  s2       1
//   sampNrm0                   s3       1
//   sampNrm1                   s4       1
//   sampEnv                    s5       1
//   sampRef                    s6       1
//   g_VerticalShadowMapSampler s7       1
//   g_ShadowMapSampler         s13      1
//

    ps_3_0
    def c0, 500, 5, 1024, 0.763941944
    def c1, 2, -1, 0.5, -3
    def c2, 0.25, 4, 0, 0
    def c3, 0, 1, 2, 3
    def c4, 0.583607316, 1, -1, 0
    def c5, -1, 1, 0, 0.5
    dcl_texcoord v0
    dcl_texcoord1 v1
    dcl_texcoord2 v2.xyz
    dcl_texcoord3_pp v3
    dcl_texcoord4 v4
    dcl_texcoord6 v5
    dcl_texcoord5_pp v6.xyz
    dcl_texcoord7 v7.xyz
    dcl_texcoord8 v8.xyz
    dcl_2d s0
    dcl_2d s2
    dcl_2d s3
    dcl_2d s4
    dcl_2d s5
    dcl_2d s6
    dcl_2d s7
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
    mad_pp r1.y, r0.x, -c1.x, -c1.w
    mul_pp r0.x, r0.x, r0.x
    mul_pp r0.x, r0.x, r1.y
    pow_sat_pp r1.y, r0.x, c61.w
    mov r2.xy, c3
    add r0.x, r2.y, -c61.x
    cmp_pp r0.x, r0.x, c3.y, r1.y
    add r1.y, -c60.z, c60.w
    rcp r1.y, r1.y
    mul_sat r1.x, r1.y, r1.x
    add_pp r1.x, -r1.x, c3.y
    cmp_pp r1.x, -c61.x, r2.y, r1.x
    mul_pp r0.x, r0.x, r1.x
    add r1.x, -c48.z, c48.w
    rcp r1.x, r1.x
    add r1.yzw, -c46.xxyz, v2.xxyz
    dp3 r2.y, r1.yzww, r1.yzww
    rsq r2.y, r2.y
    rcp r2.z, r2.y
    mul_pp r1.yzw, r1, r2.y
    add r2.y, r2.z, -c48.z
    mul_sat r1.x, r1.x, r2.y
    add_pp r1.x, -r1.x, c3.y
    add r2.y, -c40.z, c40.w
    rcp r2.y, r2.y
    add r3.xyz, -c38, v2
    dp3 r2.z, r3, r3
    rsq r2.z, r2.z
    rcp r2.w, r2.z
    mul_pp r3.xyz, r2.z, r3
    add r2.z, r2.w, -c40.z
    mul_sat r2.y, r2.y, r2.z
    add r2.z, -c44.z, c44.w
    rcp r2.z, r2.z
    add r4.xyz, -c42, v2
    dp3 r2.w, r4, r4
    rsq r2.w, r2.w
    rcp r3.w, r2.w
    mul_pp r4.xyz, r2.w, r4
    add r2.w, r3.w, -c44.z
    mul_sat r2.z, r2.z, r2.w
    add_pp r2.yz, -r2, c3.y
    frc r5.xy, c27
    cmp r5.zw, -r5.xyxy, c3.x, c3.y
    add r5.xy, -r5, c27
    cmp r5.zw, c27.xyxy, r2.x, r5
    add r5.xy, r5.zwzw, r5
    add r6, r5.x, -c3
    add r5, r5.y, -c3
    cmp r7.xy, -r6_abs.x, v0, c3.x
    cmp r6.xy, -r6_abs.y, v0.zwzw, r7
    cmp r6.xy, -r6_abs.z, v1, r6
    cmp r6.xy, -r6_abs.w, v1.zwzw, r6
    texld_pp r6, r6, s3
    mul_pp r6.x, r6.w, r6.x
    mad_pp r6.xy, r6, c1.x, c1.y
    dp2add_pp r2.w, r6, -r6, c3.y
    rsq_pp r2.w, r2.w
    rcp_pp r2.w, r2.w
    nrm_pp r7, v8.xyzx
    mul_pp r8, r6.y, r7.wyzw
    nrm_pp r9, v7.xyzx
    mad_pp r6, r6.x, r9.wyzw, r8
    nrm_pp r8, v3.xyzx
    mad_pp r6, r2.w, r8.wyzw, r6
    dp3_pp r2.w, r6.wyzw, -r4
    mul_pp r10.xyz, r2.w, c43
    cmp_pp r10.xyz, r2.w, r10, c3.x
    mul_pp r10.xyz, r2.z, r10
    dp3_pp r2.w, r6.wyzw, -r3
    mul_pp r11.xyz, r2.w, c39
    cmp_pp r11.xyz, r2.w, r11, c3.x
    mad_pp r10.xyz, r2.y, r11, r10
    dp3_pp r2.w, r6.wyzw, -r1.yzww
    mul_pp r11.xyz, r2.w, c47
    cmp_pp r11.xyz, r2.w, r11, c3.x
    mad_pp r10.xyz, r1.x, r11, r10
    add r2.w, -c52.z, c52.w
    rcp r2.w, r2.w
    add r11.xyz, -c50, v2
    dp3 r3.w, r11, r11
    rsq r3.w, r3.w
    rcp r4.w, r3.w
    mul_pp r11.xyz, r3.w, r11
    add r3.w, r4.w, -c52.z
    mul_sat r2.w, r2.w, r3.w
    add_pp r2.w, -r2.w, c3.y
    dp3_pp r3.w, r6.wyzw, -r11
    mul_pp r12.xyz, r3.w, c51
    cmp_pp r12.xyz, r3.w, r12, c3.x
    mad_pp r10.xyz, r2.w, r12, r10
    max r3.w, v4.z, c3.x
    add r4.w, r3.w, -v4.w
    cmp r12.z, r4.w, c3.x, r3.w
    mov r12.xyw, v4
    texldp_pp r12, r12, s13
    max r3.w, v5.z, c3.x
    add r4.w, r3.w, -v5.w
    cmp r13.z, r4.w, c3.x, r3.w
    mov r13.xyw, v5
    texldp_pp r13, r13, s7
    min_pp r3.w, r13.x, r12.x
    lrp_pp r4.w, v6.z, c3.y, r3.w
    rcp r3.w, v4.w
    mul r12.xy, r3.w, v4
    mad r12.xy, r12, c1.x, c1.y
    abs_sat r12.xy, r12
    add_sat r12.xy, r12, -c65.x
    mul r12.xy, r12, c65.y
    max r3.w, r12.x, r12.y
    lrp_pp r10.w, r3.w, c3.y, r4.w
    mul r3.w, r10.w, c77.w
    dp3_pp r4.w, r6.wyzw, -c10
    mul r12.xyz, r4.w, c36
    mul_pp r12.xyz, r3.w, r12
    cmp_pp r12.xyz, r4.w, r12, c3.x
    add_pp r10.xyz, r10, r12
    dp3_pp r4.w, r6.wyzw, -r0.yzww
    mul_pp r12.xyz, c58.w, c58
    mul_pp r12.xyz, r4.w, r12
    cmp_pp r12.xyz, r4.w, r12, c3.x
    mad_pp r10.xyz, r0.x, r12, r10
    mov r12.xyz, c79
    add r12.xyz, -r12, c80
    mad_pp r13.xyz, r6.wyzw, c1.z, c1.z
    mad r12.xyz, r13.y, r12, c79
    mul_pp r14.xyz, r6.wyzw, r6.wyzw
    mul r12.xyz, r12, r14.y
    mov r15.xyz, c77
    add r15.xyz, -r15, c78
    mad r13.xyw, r13.x, r15.xyzz, c77.xyzz
    mad_pp r12.xyz, r14.x, r13.xyww, r12
    mov r15.xyz, c81
    add r13.xyw, -r15.xyzz, c82.xyzz
    mad r13.xyz, r13.z, r13.xyww, c81
    mad_pp r12.xyz, r14.z, r13, r12
    mad_pp r10.xyz, r12, c17, r10
    mul_pp r10.xyz, r10, c16
    frc r12.xy, c26.xwzw
    cmp r12.zw, -r12.xyxy, c3.x, c3.y
    add r12.xy, -r12, c26.xwzw
    cmp r12.zw, c26.xyxw, r2.x, r12
    add r12.xy, r12.zwzw, r12
    add r13, r12.y, -c3
    add r12, r12.x, -c3
    cmp r14.xy, -r13_abs.x, v0, c3.x
    cmp r13.xy, -r13_abs.y, v0.zwzw, r14
    cmp r13.xy, -r13_abs.z, v1, r13
    cmp r13.xy, -r13_abs.w, v1.zwzw, r13
    texld_pp r13, r13, s2
    mul_pp r13.yz, r13.x, c20
    mul_pp r13.yz, r13, c0.xxyw
    mul_pp r14.xyz, r13.z, c43
    add_pp r15, c22.xyzx, -v2.xyzx
    dp3_pp r2.x, r15.yzww, r15.yzww
    rsq_pp r2.x, r2.x
    mad_pp r4.xyz, r15, r2.x, -r4
    nrm_pp r16.xyz, r4
    dp3_sat_pp r4.x, r16, r6
    max_pp r4.y, r13.y, c3.y
    min r10.w, r4.y, c0.z
    pow r11.w, r4.x, r10.w
    mul_pp r4.xyz, r11.w, r14
    mul_pp r4.xyz, r2.z, r4
    mul_pp r14.xyz, r13.z, c39
    mad_pp r3.xyz, r15, r2.x, -r3
    nrm_pp r16.xyz, r3
    dp3_sat_pp r2.z, r16, r6
    pow r3.x, r2.z, r10.w
    mul_pp r3.xyz, r3.x, r14
    mad_pp r3.xyz, r2.y, r3, r4
    mul_pp r4.xyz, r13.z, c47
    mad_pp r1.yzw, r15.xxyz, r2.x, -r1
    nrm_pp r14.xyz, r1.yzww
    dp3_sat_pp r1.y, r14, r6
    pow r2.y, r1.y, r10.w
    mul_pp r1.yzw, r2.y, r4.xxyz
    mad_pp r1.xyz, r1.x, r1.yzww, r3
    mul_pp r3.xyz, r13.z, c51
    mad_pp r4.xyz, r15, r2.x, -r11
    nrm_pp r11.xyz, r4
    dp3_sat_pp r1.w, r11, r6
    pow r2.y, r1.w, r10.w
    mul_pp r3.xyz, r2.y, r3
    mad_pp r1.xyz, r2.w, r3, r1
    mul_pp r2.yzw, r13.z, c37.xxyz
    mad_pp r3.xyz, r15, r2.x, -c10
    nrm_pp r4.xyz, r3
    dp3_sat_pp r1.w, r4, r6
    pow r3.x, r1.w, r10.w
    mul_pp r2.yzw, r2, r3.x
    mad_pp r1.xyz, r2.yzww, r3.w, r1
    mad_pp r0.yzw, r15.xxyz, r2.x, -r0
    mul_pp r2, r2.x, r15
    nrm_pp r3.xyz, r0.yzww
    dp3_sat_pp r0.y, r3, r6
    pow r1.w, r0.y, r10.w
    mul_pp r0.yzw, c59.w, c59.xxyz
    mul_pp r0.yzw, r13.z, r0
    mul_pp r0.yzw, r1.w, r0
    mad_pp r0.xyz, r0.x, r0.yzww, r1
    mul_pp r0.xyz, r0, c18
    mul_pp r0.xyz, r0, v3.w
    cmp r1.xy, -r12_abs.x, v0, c3.x
    cmp r1.xy, -r12_abs.y, v0.zwzw, r1
    cmp r1.xy, -r12_abs.z, v1, r1
    cmp r1.xy, -r12_abs.w, v1.zwzw, r1
    texld_pp r1, r1, s0
    mad_pp r0.xyz, r10, r1, r0
    mul_pp r1.w, r1.w, c16.w
    cmp r3.xy, -r5_abs.x, v0, c3.x
    cmp r3.xy, -r5_abs.y, v0.zwzw, r3
    cmp r3.xy, -r5_abs.z, v1, r3
    cmp r3.xy, -r5_abs.w, v1.zwzw, r3
    texld_pp r4, r3, s4
    mul_pp r4.x, r4.w, r4.x
    mad_pp r3.xy, r4, c1.x, c1.y
    mul_pp r4, r7, r3.y
    mad_pp r4, r3.x, r9, r4
    dp2add_pp r0.w, r3, -r3, c3.y
    rsq_pp r0.w, r0.w
    rcp_pp r0.w, r0.w
    mad r4, r0.w, r8, r4
    dp3_pp r0.w, r2.yzww, r4.yzww
    mad_pp r3.x, r0.w, -r0.w, c3.y
    mad_pp r3.x, r3.x, -c4.x, c4.y
    rsq_pp r3.x, r3.x
    rcp_pp r3.x, r3.x
    mad r0.w, r0.w, c0.w, -r3.x
    mul_pp r5, r2.wyzw, c0.w
    mad r4, r4, r0.w, -r5
    mad r5, r4.wyzw, c5.xxyz, c5.zzzw
    mul r7, r4, c4.yzzw
    cmp_pp r4, r4.z, r5, r7
    add_pp r0.w, r4.z, c3.y
    rcp r0.w, r0.w
    mad_pp r3.xy, r4.yxzw, r0.w, c3.y
    mad_pp r4.x, r3.y, c2.x, r4.w
    mul_pp r4.y, r3.x, c1.z
    texld_pp r4, r4, s6
    mul r3.xyz, r4, c63.x
    mad_pp r3.xyz, r3, r4.w, r4
    mul_pp r3.xyz, r13.x, r3
    mul r0.w, c64.z, c64.x
    mov r4.xz, c64
    mad r4.x, r4.x, -r4.z, r4.z
    mad_pp r0.w, r3.w, r4.x, r0.w
    dp3_pp r3.w, r2.yzww, r6.yzww
    add_pp r3.w, r3.w, r3.w
    mad r2, r3.w, r6, -r2
    mad r4, r2.wyzw, c5.xxyz, c5.zzzw
    mul r5, r2, c4.yzzw
    cmp_pp r2, r2.z, r4, r5
    add_pp r2.z, r2.z, c3.y
    rcp r2.z, r2.z
    mad_pp r2.xy, r2.yxzw, r2.z, c3.y
    mad_pp r4.x, r2.y, c2.x, r2.w
    mul_pp r4.y, r2.x, c1.z
    texld_pp r2, r4, s5
    mul r4.xyz, r2, c63.x
    mad_pp r2.xyz, r4, r2.w, r2
    mul_pp r2.xyz, r13.x, r2
    mad_pp r2.xyz, r2, r0.w, -r3
    mov_sat_pp r0.w, v3.w
    mad_pp r2.xyz, r0.w, r2, r3
    add_pp r1.xyz, r0, r2
    mul_pp r0, r1, c89
    min_pp r1, r0, c2.y
    mul_pp r0.xyz, c75, v6.y
    mad_pp oC0.xyz, r1, v6.x, r0
    mov_pp oC0.w, r1.w

// approximately 316 instruction slots used (8 texture, 308 arithmetic)
