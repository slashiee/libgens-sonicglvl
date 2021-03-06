//
// Generated by Microsoft (R) HLSL Shader Compiler 9.29.952.3111
//
// Parameters:
//
//   float4 g_Ambient;
//   float4 g_Diffuse;
//   float4 g_EyePosition;
//   float4 g_PowerGlossLevel;
//   float4 g_Specular;
//   float4 g_TransColorMask;
//   float4 g_aLightField[6];
//   float4 mrgGlobalLight_Diffuse;
//   float4 mrgGlobalLight_Direction;
//   float4 mrgGlobalLight_Specular;
//   float4 mrgTexcoordIndex[4];
//   sampler2D sampDLScatter;
//   sampler2D sampDif;
//   sampler2D sampSpe;
//
//
// Registers:
//
//   Name                     Reg   Size
//   ------------------------ ----- ----
//   mrgGlobalLight_Direction c10      1
//   g_Diffuse                c16      1
//   g_Ambient                c17      1
//   g_Specular               c18      1
//   g_PowerGlossLevel        c20      1
//   g_EyePosition            c22      1
//   mrgTexcoordIndex         c26      1
//   mrgGlobalLight_Diffuse   c36      1
//   mrgGlobalLight_Specular  c37      1
//   g_aLightField            c77      6
//   g_TransColorMask         c150     1
//   sampDif                  s0       1
//   sampSpe                  s1       1
//   sampDLScatter            s9       1
//

    ps_3_0
    def c0, 0.5, 500, 5, 1024
    def c1, 0, 1, 2, 3
    dcl_texcoord v0
    dcl_texcoord1 v1
    dcl_texcoord2 v2.xyz
    dcl_texcoord3_pp v3
    dcl_texcoord5 v4.xy
    dcl vFace
    dcl_2d s0
    dcl_2d s1
    dcl_2d s9
    frc r0.xy, c26.xzzw
    cmp r0.zw, -r0.xyxy, c1.x, c1.y
    add r0.xy, -r0, c26.xzzw
    mov r1.x, c1.x
    cmp r0.zw, c26.xyxz, r1.x, r0
    add r0.xy, r0.zwzw, r0
    add r1, r0.x, -c1
    add r0, r0.y, -c1
    cmp r2.xy, -r1_abs.x, v0, c1.x
    cmp r1.xy, -r1_abs.y, v0.zwzw, r2
    cmp r1.xy, -r1_abs.z, v1, r1
    cmp r1.xy, -r1_abs.w, v1.zwzw, r1
    texld_pp r1, r1, s0
    mul_pp oC0.w, r1.w, c16.w
    mov r2, c77
    mul r3.xyz, r2.w, c36
    cmp_pp r4.xyz, vFace, v3, -v3
    nrm_pp r5.xyz, r4
    dp3 r1.w, r5, -c10
    mov_sat_pp r3.w, -r1.w
    mov_sat_pp r1.w, r1.w
    mul_pp r4.xyz, r3.w, r3
    mul_pp r3.xyz, r1.w, r3
    mul_pp r3.xyz, r3, c16
    mul_pp r4.xyz, r4, c16
    mul_pp r4.xyz, r1, r4
    mul r4.xyz, r4, c150
    mad_pp r6.xyz, r5, c0.x, c0.x
    mov r7.xyz, c80
    mad r7.xyz, r7, r6.y, c79
    mul_pp r8.xyz, r5, r5
    mul r7.xyz, r7, r8.y
    mad r2.xyz, c78, r6.x, r2
    mov r9.xyz, c82
    mad r6.xyz, r9, r6.z, c81
    mad_pp r2.xyz, r8.x, r2, r7
    mad_pp r2.xyz, r8.z, r6, r2
    mad_pp r2.xyz, r2, c17, r3
    mad_pp r1.xyz, r2, r1, r4
    cmp r2.xy, -r0_abs.x, v0, c1.x
    cmp r0.xy, -r0_abs.y, v0.zwzw, r2
    cmp r0.xy, -r0_abs.z, v1, r0
    cmp r0.xy, -r0_abs.w, v1.zwzw, r0
    texld_pp r0, r0, s1
    add_pp r2.xyz, c22, -v2
    dp3_pp r0.w, r2, r2
    rsq_pp r0.w, r0.w
    mad_pp r2.xyz, r2, r0.w, -c10
    nrm_pp r3.xyz, r2
    dp3_sat_pp r0.w, r3, r5
    mov_pp r2.yz, c0
    mul_pp r2.xy, r2.yzzw, c20.yzzw
    max_pp r3.x, r2.x, c1.y
    mul_pp r2.xyz, r2.y, c18
    min r4.x, r3.x, c0.w
    pow_pp r3.x, r0.w, r4.x
    mul r3.yzw, r2.w, c37.xxyz
    mul r3.yzw, r1.w, r3
    mul_pp r3.xyz, r3.x, r3.yzww
    mul_pp r2.xyz, r2, r3
    mul_pp r0.xyz, r0, r2
    mad_pp r0.xyz, r0, v3.w, r1
    texld_pp r1, v4.yxzw, s9
    mad_pp oC0.xyz, r0, r1.w, r1

// approximately 70 instruction slots used (3 texture, 67 arithmetic)
