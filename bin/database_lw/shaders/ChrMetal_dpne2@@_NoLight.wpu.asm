//
// Generated by Microsoft (R) HLSL Shader Compiler 9.29.952.3111
//
// Parameters:
//
//   float4 g_Ambient;
//   float4 g_Diffuse;
//   float4 g_EyePosition;
//   sampler2D g_FramebufferSampler;
//   float4 g_GIModeParam;
//   float4 g_OpacityReflectionRefractionSpectype;
//   float4 g_PowerGlossLevel;
//   float4 g_Specular;
//   float4 g_ViewportSize;
//   float4 g_aLightField[6];
//   float4 mrgEyeLight_Diffuse;
//   float4 mrgEyeLight_Range;
//   float4 mrgEyeLight_Specular;
//   float4 mrgGlobalLight_Diffuse;
//   float4 mrgGlobalLight_Direction;
//   float4 mrgGlobalLight_Specular;
//   float4 mrgInShadowScale;
//   float4 mrgLuminanceRange;
//   sampler2D sampDLScatter;
//   sampler2D sampDif;
//   samplerCUBE sampEnv;
//   sampler2D sampNrm;
//   sampler2D sampPower;
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
//   g_ViewportSize                        c24      1
//   mrgGlobalLight_Diffuse                c36      1
//   mrgGlobalLight_Specular               c37      1
//   mrgEyeLight_Diffuse                   c58      1
//   mrgEyeLight_Specular                  c59      1
//   mrgEyeLight_Range                     c60      1
//   mrgLuminanceRange                     c63      1
//   mrgInShadowScale                      c64      1
//   g_GIModeParam                         c69      1
//   g_aLightField                         c77      6
//   sampDif                               s0       1
//   sampPower                             s1       1
//   sampNrm                               s2       1
//   sampEnv                               s3       1
//   sampDLScatter                         s9       1
//   g_FramebufferSampler                  s11      1
//

    ps_3_0
    def c0, 2, -1, 0, 1
    def c1, 0.5, 10, 4, 0
    dcl_texcoord v0.xy
    dcl_texcoord2 v1.xyz
    dcl_texcoord3_pp v2
    dcl_texcoord5 v3.xy
    dcl_texcoord7 v4.xyz
    dcl_texcoord8 v5.xyz
    dcl vPos.xy
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    dcl_cube s3
    dcl_2d s9
    dcl_2d s11
    texld_pp r0, v0, s0
    mul_pp r0.w, r0.w, c16.w
    mul_pp oC0.w, r0.w, c21.x
    mov r1.y, c1.y
    mul_pp r0.w, r1.y, c20.y
    exp_pp r0.w, r0.w
    mul_pp r0.w, r0.w, c1.z
    nrm_pp r1.xyz, v5
    texld_pp r2, v0, s2
    mul_pp r2.x, r2.w, r2.x
    mad_pp r2.xy, r2, c0.x, c0.y
    mul_pp r1.xyz, r1, r2.y
    nrm_pp r3.xyz, v4
    mad_pp r1.xyz, r2.x, r3, r1
    dp2add_sat_pp r1.w, r2, r2, c0.z
    add r1.w, -r1.w, c0.w
    rsq r1.w, r1.w
    rcp_pp r1.w, r1.w
    nrm_pp r2.xyz, v2
    mad_pp r1.xyz, r1.w, r2, r1
    add r2.xyz, c22, -v1
    dp3 r1.w, r2, r2
    rsq r1.w, r1.w
    mad_pp r3.xyz, r2, r1.w, -c10
    mul_pp r2.xyz, r1.w, r2
    rcp r1.w, r1.w
    mad_sat_pp r1.w, -r1.w, c60.z, c60.w
    nrm_pp r4.xyz, r3
    dp3_sat_pp r2.w, r4, r1
    pow_pp r3.x, r2.w, r0.w
    mov r4, c77
    mul_pp r2.w, r4.w, c20.z
    mul_pp r2.w, r3.x, r2.w
    mul_pp r3.xyz, r1.w, c59
    mul r5.xyz, r1.w, c58
    add_pp r6.xyz, r2, r2
    nrm_pp r7.xyz, r6
    dp3_sat_pp r1.w, r7, r1
    pow_pp r3.w, r1.w, r0.w
    mul_pp r0.w, r3.w, c20.z
    mul_pp r3.xyz, r3, r0.w
    mad_pp r3.xyz, r2.w, c37, r3
    dp3 r0.w, -r2, r1
    add r0.w, r0.w, r0.w
    mad_pp r6.xyz, r1, -r0.w, -r2
    dp3_sat_pp r0.w, r1, r2
    mul_pp r2.xyz, r5, r0.w
    texld_pp r5, r6, s3
    mul_pp r5.xyz, r5, c63.x
    texld_pp r6, v0, s1
    mul_pp r5.xyz, r5, r6.w
    mul r0.w, c64.z, c64.x
    mov r6.xz, c64
    mad r1.w, r6.x, -r6.z, r6.z
    mad_pp r0.w, c77.w, r1.w, r0.w
    mul_pp r5.xyz, r0.w, r5
    mad_pp r3.xyz, r3, c18, r5
    mul_pp r3.xyz, r3, v2.w
    mad_pp r5.xyz, r1, c1.x, c1.x
    mov r6.xyz, c80
    mad r6.xyz, r6, r5.y, c79
    mul_pp r7.xyz, r1, r1
    dp3_sat_pp r0.w, r1, -c10
    mul r0.w, r0.w, c77.w
    mad_pp r1.xyz, r0.w, c36, r2
    mul r2.xyz, r6, r7.y
    mad r4.xyz, c78, r5.x, r4
    mov r6.xyz, c82
    mad r5.xyz, r6, r5.z, c81
    mad_pp r2.xyz, r7.x, r4, r2
    mad_pp r2.xyz, r7.z, r5, r2
    mad_pp r1.xyz, r2, c17, r1
    mul_pp r1.xyz, r1, c16
    mad_pp r0.xyz, r1, r0, r3
    texld_pp r1, v3.yxzw, s9
    mad_pp r0.xyz, r0, r1.w, r1
    add r1.xy, c1.x, vPos
    mul r1.xy, r1, c24.zwzw
    texld r1, r1, s11
    add r1.xyz, -r0, r1
    mul r0.w, c69.z, v3.x
    mad_pp oC0.xyz, r0.w, r1, r0

// approximately 97 instruction slots used (6 texture, 91 arithmetic)