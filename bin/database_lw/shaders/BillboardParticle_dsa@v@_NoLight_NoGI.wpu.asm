//
// Generated by Microsoft (R) HLSL Shader Compiler 9.29.952.3111
//
// Parameters:
//
//   float4 g_ForceAlphaColor;
//   float4 g_ParticleColorScale;
//   sampler2D sampSpe;
//
//
// Registers:
//
//   Name                 Reg   Size
//   -------------------- ----- ----
//   g_ForceAlphaColor    c89      1
//   g_ParticleColorScale c151     1
//   sampSpe              s1       1
//

    ps_3_0
    def c0, 1, 0, 4, 0
    dcl_texcoord v0.zw
    dcl_color_pp v1.y
    dcl_2d s1
    mov_pp oC0.w, c0.y
    texld r0, v0.zwzw, s1
    add_sat_pp r0.w, c0.x, -v1.y
    mul_pp r0.xyz, r0.w, r0
    mul_pp r0.xyz, r0, c151
    mul_pp r0.xyz, r0, c89
    min_pp oC0.xyz, r0, c0.z

// approximately 7 instruction slots used (1 texture, 6 arithmetic)
