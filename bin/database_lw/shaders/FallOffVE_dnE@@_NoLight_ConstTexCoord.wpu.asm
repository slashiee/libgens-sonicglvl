//
// Generated by Microsoft (R) HLSL Shader Compiler 9.29.952.3111
//
// Parameters:
//
//   float4 g_Ambient;
//   float4 g_Diffuse;
//   float4 g_EmissionParam;
//   float4 g_EyePosition;
//   sampler2D g_GISampler;
//   float4 g_SonicSkinFalloffParam;
//   float4 mrgGlobalLight_Diffuse;
//   float4 mrgGlobalLight_Direction;
//   float4 mrgInShadowScale;
//   sampler2D sampDLScatter;
//   sampler2D sampDif;
//   sampler2D sampFO;
//   sampler2D sampNrm;
//
//
// Registers:
//
//   Name                     Reg   Size
//   ------------------------ ----- ----
//   mrgGlobalLight_Direction c10      1
//   g_Diffuse                c16      1
//   g_Ambient                c17      1
//   g_EyePosition            c22      1
//   mrgGlobalLight_Diffuse   c36      1
//   mrgInShadowScale         c64      1
//   g_SonicSkinFalloffParam  c150     1
//   g_EmissionParam          c151     1
//   sampDif                  s0       1
//   sampNrm                  s2       1
//   sampFO                   s4       1
//   sampDLScatter            s9       1
//   g_GISampler              s10      1
//

    ps_3_0
    def c0, 2, -1, 0, 1
    dcl_texcoord v0
    dcl_texcoord1 v1
    dcl_texcoord2 v2.xyz
    dcl_texcoord3 v3.xyz
    dcl_texcoord5 v4.xy
    dcl_texcoord7 v5.xyz
    dcl_texcoord8 v6.xyz
    dcl_color_pp v7
    dcl_2d s0
    dcl_2d s2
    dcl_2d s4
    dcl_2d s9
    dcl_2d s10
    texld_pp r0, v0, s0
    mul_pp r0.w, r0.w, c16.w
    mul_pp oC0.w, r0.w, v7.w
    nrm_pp r1.xyz, v6
    texld_pp r2, v1, s2
    mul_pp r2.x, r2.w, r2.x
    mad_pp r2.xy, r2, c0.x, c0.y
    mul_pp r1.xyz, r1, r2.y
    nrm_pp r3.xyz, v5
    mad_pp r1.xyz, r2.x, r3, r1
    dp2add_sat_pp r0.w, r2, r2, c0.z
    add r0.w, -r0.w, c0.w
    rsq r0.w, r0.w
    rcp_pp r0.w, r0.w
    nrm_pp r2.xyz, v3
    mad_pp r1.xyz, r0.w, r2, r1
    dp3_sat_pp r0.w, r1, -c10
    texld r1, v0.zwzw, s10
    mul r0.w, r0.w, r1.w
    mul_pp r3.xyz, r0.w, c36
    mad_pp r1.xyz, r1, r1, r3
    mul_pp r1.xyz, r1, c16
    add_pp r3.xyz, c22, -v2
    nrm_pp r4.xyz, r3
    dp3_pp r0.w, r2, r4
    mov_pp r2.w, c0.w
    add_pp r2.x, r2.w, c150.w
    add_sat_pp r0.w, -r0.w, r2.x
    pow_pp r2.x, r0.w, c150.z
    mad_pp r0.w, c150.y, r2.x, c150.x
    mul_pp r2.xyz, r0.w, v7
    mul r0.w, c64.w, c64.y
    mov r3.yw, c64
    mad r2.w, r3.y, -r3.w, r3.w
    mad_pp r0.w, r1.w, r2.w, r0.w
    mul_pp r2.xyz, r0.w, r2
    mad_pp r0.xyz, r1, r0, r2
    texld_pp r1, v1.zwzw, s4
    add r1.xyz, r1, c151
    mul r1.xyz, r1, c17
    mul_pp r1.xyz, r1, c151.w
    mad_pp r0.xyz, r1, c17, r0
    texld_pp r1, v4.yxzw, s9
    mad_pp oC0.xyz, r0, r1.w, r1

// approximately 55 instruction slots used (5 texture, 50 arithmetic)