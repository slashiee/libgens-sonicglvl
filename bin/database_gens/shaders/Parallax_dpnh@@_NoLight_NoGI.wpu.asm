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
//   sampler2D g_VerticalShadowMapSampler;
//   float4 g_aLightField[6];
//   float4 mrgEyeLight_Attribute;
//   float4 mrgEyeLight_Diffuse;
//   float4 mrgEyeLight_Range;
//   float4 mrgEyeLight_Specular;
//   float4 mrgGlobalLight_Diffuse;
//   float4 mrgGlobalLight_Direction;
//   float4 mrgGlobalLight_Specular;
//   float4 mrgTexcoordIndex[4];
//   sampler2D sampDif;
//   sampler2D sampHeight;
//   sampler2D sampNrm;
//   sampler2D sampPower;
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
//   mrgEyeLight_Diffuse        c58      1
//   mrgEyeLight_Specular       c59      1
//   mrgEyeLight_Range          c60      1
//   mrgEyeLight_Attribute      c61      1
//   g_ShadowMapParams          c65      1
//   g_GI0Scale                 c70      1
//   g_LightScatteringColor     c75      1
//   g_aLightField              c77      6
//   g_ForceAlphaColor          c89      1
//   sampDif                    s0       1
//   sampPower                  s2       1
//   sampNrm                    s3       1
//   sampHeight                 s4       1
//   g_VerticalShadowMapSampler s7       1
//   g_ShadowMapSampler         s13      1
//

    ps_3_0
    def c0, 0.0299999993, 2, -1, 0.5
    def c1, 1024, 4, 0, 0
    def c2, -2, 3, 500, 5
    def c3, 0, 1, 2, 3
    dcl_texcoord v0
    dcl_texcoord1 v1
    dcl_texcoord2 v2.xyz
    dcl_texcoord3_pp v3
    dcl_texcoord4_pp v4
    dcl_texcoord5_pp v5
    dcl_texcoord6 v6
    dcl_texcoord8 v7
    dcl_texcoord7_pp v8
    dcl_2d s0
    dcl_2d s2
    dcl_2d s3
    dcl_2d s4
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
    mad_pp r1.y, r0.x, c2.x, c2.y
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
    max r1.x, v6.z, c3.x
    add r1.y, r1.x, -v6.w
    cmp r1.z, r1.y, c3.x, r1.x
    mov r1.xyw, v6
    texldp_pp r1, r1, s13
    max r1.y, v7.z, c3.x
    add r1.z, r1.y, -v7.w
    cmp r3.z, r1.z, c3.x, r1.y
    mov r3.xyw, v7
    texldp_pp r3, r3, s7
    min_pp r2.y, r3.x, r1.x
    lrp_pp r1.x, v8.z, c3.y, r3.x
    lrp_pp r1.y, v8.z, c3.y, r2.y
    rcp r1.z, v6.w
    mul r1.zw, r1.z, v6.xyxy
    mad r1.zw, r1, c0.y, c0.z
    abs_sat r1.zw, r1
    add_sat r1.zw, r1, -c65.x
    mul r1.zw, r1, c65.y
    max r2.y, r1.z, r1.w
    lrp_pp r3.x, r2.y, c3.y, r1.y
    lrp_pp r3.y, r2.y, c3.y, r1.x
    mul_pp r1.x, r3.x, c77.w
    frc r1.yz, c27.xxyw
    cmp r2.yz, -r1, c3.x, c3.y
    add r1.yz, -r1, c27.xxyw
    cmp r2.yz, c27.xxyw, r2.x, r2
    add r1.yz, r1, r2
    add r4, r1.y, -c3
    add r5, r1.z, -c3
    cmp r1.yz, -r4_abs.x, v0.xxyw, c3.x
    cmp r1.yz, -r4_abs.y, v0.xzww, r1
    cmp r1.yz, -r4_abs.z, v1.xxyw, r1
    cmp r1.yz, -r4_abs.w, v1.xzww, r1
    cmp r2.yz, -r5_abs.x, v0.xxyw, c3.x
    cmp r2.yz, -r5_abs.y, v0.xzww, r2
    cmp r2.yz, -r5_abs.z, v1.xxyw, r2
    cmp r2.yz, -r5_abs.w, v1.xzww, r2
    texld_pp r4, r2.yzzw, s4
    mul_pp r1.w, r4.x, c0.x
    mov_pp r4.z, v5.w
    mov_pp r4.x, v3.w
    mov_pp r4.y, v4.w
    dp3_pp r2.y, r4, r4
    rsq_pp r2.y, r2.y
    mul_pp r2.yz, r2.y, r4.xxyw
    mad r1.yz, r2, r1.w, r1
    texld_pp r4, r1.yzzw, s3
    mul_pp r4.x, r4.w, r4.x
    mad_pp r1.yz, r4.xxyw, c0.y, c0.z
    nrm_pp r4.xyz, v4
    mul_pp r3.xzw, r1.z, r4.xyyz
    nrm_pp r4.xyz, v3
    mad_pp r3.xzw, r1.y, r4.xyyz, r3
    dp2add_pp r1.y, r1.yzzw, -r1.yzzw, c3.y
    rsq_pp r1.y, r1.y
    rcp_pp r1.y, r1.y
    nrm_pp r4.xyz, v5
    mad_pp r3.xzw, r1.y, r4.xyyz, r3
    dp3_pp r1.y, r3.xzww, -c10
    mul r4.xyz, r1.y, c36
    mul_pp r4.xyz, r1.x, r4
    cmp_pp r4.xyz, r1.y, r4, c3.x
    dp3_pp r1.y, r3.xzww, -r0.yzww
    mul_pp r5.xyz, c58.w, c58
    mul_pp r5.xyz, r1.y, r5
    cmp_pp r5.xyz, r1.y, r5, c3.x
    mad_pp r4.xyz, r0.x, r5, r4
    mad_pp r5.xyz, r3.xzww, c0.w, c0.w
    mov r6.xyz, c79
    add r6.xyz, -r6, c80
    mad r6.xyz, r5.y, r6, c79
    mul_pp r7.xyz, r3.xzww, r3.xzww
    mul r6.xyz, r6, r7.y
    mov r8.xyz, c77
    add r8.xyz, -r8, c78
    mad r5.xyw, r5.x, r8.xyzz, c77.xyzz
    mad_pp r5.xyw, r7.x, r5, r6.xyzz
    mov r6.xyz, c81
    add r6.xyz, -r6, c82
    mad r6.xyz, r5.z, r6, c81
    mad_pp r5.xyz, r7.z, r6, r5.xyww
    mul_pp r6.xyz, r5, c17
    mul r6.xyz, r6, c70.w
    mad r5.xyz, r5, c17, -r6
    mad_pp r5.xyz, r3.y, r5, r6
    add_pp r4.xyz, r4, r5
    mul_pp r4.xyz, r4, c16
    add_pp r5.xyz, c22, -v2
    dp3_pp r1.y, r5, r5
    rsq_pp r1.y, r1.y
    mad_pp r0.yzw, r5.xxyz, r1.y, -r0
    mad_pp r5.xyz, r5, r1.y, -c10
    nrm_pp r6.xyz, r5
    dp3_sat_pp r1.y, r6, r3.xzww
    nrm_pp r5.xyz, r0.yzww
    dp3_sat_pp r0.y, r5, r3.xzww
    frc r0.zw, c26.xyxw
    cmp r3.xy, -r0.zwzw, c3.x, c3.y
    add r0.zw, -r0, c26.xyxw
    cmp r2.xw, c26, r2.x, r3.xyzy
    add r0.zw, r0, r2.xyxw
    add r3, r0.w, -c3
    add r5, r0.z, -c3
    cmp r0.zw, -r3_abs.x, v0.xyxy, c3.x
    cmp r0.zw, -r3_abs.y, v0, r0
    cmp r0.zw, -r3_abs.z, v1.xyxy, r0
    cmp r0.zw, -r3_abs.w, v1, r0
    mad r0.zw, r2.xyyz, r1.w, r0
    texld_pp r3, r0.zwzw, s2
    mul_pp r0.zw, r3.x, c20.xyyz
    mul_pp r0.zw, r0, c2
    max_pp r1.z, r0.z, c3.y
    min r0.z, r1.z, c1.x
    pow r1.z, r0.y, r0.z
    pow r2.x, r1.y, r0.z
    mul_pp r3.xyz, c59.w, c59
    mul_pp r3.xyz, r0.w, r3
    mul_pp r0.yzw, r0.w, c37.xxyz
    mul_pp r0.yzw, r2.x, r0
    mul_pp r3.xyz, r1.z, r3
    mul_pp r3.xyz, r0.x, r3
    mad_pp r0.xyz, r0.yzww, r1.x, r3
    mul_pp r0.xyz, r0, c18
    mul_pp r0.xyz, r0, v8.w
    cmp r1.xy, -r5_abs.x, v0, c3.x
    cmp r1.xy, -r5_abs.y, v0.zwzw, r1
    cmp r1.xy, -r5_abs.z, v1, r1
    cmp r1.xy, -r5_abs.w, v1.zwzw, r1
    mad r1.xy, r2.yzzw, r1.w, r1
    texld_pp r1, r1, s0
    mad_pp r0.xyz, r4, r1, r0
    mul_pp r0.w, r1.w, c16.w
    mul_pp r0, r0, c89
    min_pp r1, r0, c1.y
    mul_pp r0.xyz, c75, v8.y
    mad_pp oC0.xyz, r1, v8.x, r0
    mov_pp oC0.w, r1.w

// approximately 179 instruction slots used (6 texture, 173 arithmetic)