//
// Generated by Microsoft (R) HLSL Shader Compiler 9.29.952.3111
//
// Parameters:
//
//   float4 g_Ambient;
//   float4 g_Diffuse;
//   float4 g_EyePosition;
//   sampler2D g_FramebufferSampler;
//   sampler2D g_GISampler;
//   row_major float4x4 g_MtxView;
//   float4 g_OffsetParam;
//   float2 g_RefractionParam;
//   float4 g_ViewportSize;
//   float2 mrgFresnelParam;
//   float4 mrgGlobalLight_Diffuse;
//   float4 mrgGlobalLight_Direction;
//   float4 mrgInShadowScale;
//   float4 mrgLuminanceRange;
//   sampler2D sampAlpha;
//   sampler2D sampDLScatter;
//   sampler2D sampDif;
//   samplerCUBE sampEnv;
//   sampler2D sampNrm;
//   sampler2D sampOffset;
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
//   g_ViewportSize           c24      1
//   mrgGlobalLight_Diffuse   c36      1
//   mrgFresnelParam          c62      1
//   mrgLuminanceRange        c63      1
//   mrgInShadowScale         c64      1
//   g_MtxView                c90      3
//   g_RefractionParam        c150     1
//   g_OffsetParam            c151     1
//   sampDif                  s0       1
//   sampNrm                  s2       1
//   sampEnv                  s3       1
//   sampOffset               s4       1
//   sampAlpha                s5       1
//   sampDLScatter            s9       1
//   g_GISampler              s10      1
//   g_FramebufferSampler     s11      1
//

    ps_3_0
    def c0, -1, 0.5, 1, 0
    def c1, 2, -2, -1, -0.707106769
    def c2, 0.5, -0.5, 0, 0
    dcl_texcoord v0
    dcl_texcoord1 v1
    dcl_texcoord2 v2.xyz
    dcl_texcoord3 v3.xyz
    dcl_texcoord5 v4.xy
    dcl_texcoord7 v5.xyz
    dcl_texcoord8 v6.xyz
    dcl_color_pp v7
    dcl vPos.xy
    dcl_2d s0
    dcl_2d s2
    dcl_cube s3
    dcl_2d s4
    dcl_2d s5
    dcl_2d s9
    dcl_2d s10
    dcl_2d s11
    add r0.xy, c0.y, vPos
    mul r0.xy, r0, c24.zwzw
    mov r1.xzw, c0
    mad r2, c24.zzww, r1.zwwx, r1.wzxw
    mad r0.xy, r0, c1, r2
    add_pp r0.xy, r2.zwzw, r0
    nrm_pp r2.xyz, v5
    nrm_pp r3.xyz, v6
    add_pp r0.z, v7.w, v7.w
    texld_pp r4, v1, s4
    mad r0.zw, r4.xywy, r0.z, c0.x
    mad r4, r0.zwzw, c151.xyxy, v0
    texld_pp r5, r4.zwzw, s2
    texld_pp r4, r4, s0
    mul_pp r5.x, r5.w, r5.x
    mad_pp r1.xy, r5, c1.x, c1.z
    mul_pp r3.xyz, r3, r1.y
    mad_pp r2.xyz, r1.x, r2, r3
    dp2add_sat_pp r1.x, r1, r1, c0.w
    add r1.x, -r1.x, c0.z
    rsq r1.x, r1.x
    rcp_pp r1.x, r1.x
    nrm_pp r3.xyz, v3
    mad r1.xyw, r1.x, r3.xyzz, r2.xyzz
    mul_pp r2.xyz, r1.y, c91
    mad_pp r2.xyz, r1.x, c90, r2
    mad_pp r2.xyz, r1.w, c92, r2
    mad r2.w, r2.z, -r2.z, c0.z
    mul r3.x, c150.x, c150.x
    mad r2.w, r3.x, -r2.w, c0.z
    cmp r3.x, r2.w, c0.z, c0.w
    mul r2.w, r2.w, r3.x
    mul r3.x, r3.x, c150.x
    rsq r2.w, r2.w
    rcp r2.w, r2.w
    mad r2.z, r3.x, -r2.z, r2.w
    mul_pp r2.xy, r2, r2.z
    mad_pp r0.xy, r2, c1.w, r0
    mad_pp r0.xy, r0.zwzw, c151, r0
    mad r0.xy, r0, c2, c2.x
    texld_pp r2, r0, s11
    dp3_sat_pp r0.x, r1.xyww, -c10
    texld r3, v0.zwzw, s10
    mul r0.x, r0.x, r3.w
    mul_pp r5.xyz, r0.x, c36
    mul_pp r3.xyz, r3, r3
    mad_pp r3.xyz, r3, c17, r5
    mul_pp r3.xyz, r3, c16
    mad r3.xyz, r3, r4, -r2
    mul_pp r0.x, r4.w, c16.w
    mul_pp r0.y, r0.x, v7.w
    mad r0.x, r0.x, -v7.w, c0.z
    mul r0.x, r0.x, c63.x
    mad_pp r2.xyz, r0.y, r3, r2
    add_pp r3.xyz, c22, -v2
    nrm r4.xyz, r3
    dp3 r0.y, -r4, r1.xyww
    add r0.y, r0.y, r0.y
    mad_pp r3.xyz, r1.xyww, -r0.y, -r4
    dp3_sat_pp r0.y, r1.xyww, r4
    add_pp r0.y, -r0.y, c0.z
    mad_pp r4.xy, r0.zwzw, c151, r3
    mov_pp r4.z, -r3.z
    texld_pp r4, r4, s3
    mul r0.z, c64.z, c64.x
    mov r3.xz, c64
    mad r0.w, r3.x, -r3.z, r3.z
    mad_pp r0.z, r3.w, r0.w, r0.z
    mul r0.x, r0.z, r0.x
    mul_pp r0.xzw, r0.x, r4.xyyz
    mul_pp r1.x, r0.y, r0.y
    mul_pp r1.x, r1.x, r1.x
    mul_pp r0.y, r0.y, r1.x
    lrp_pp r2.w, r0.y, r1.z, c62.x
    mad_pp r0.xyz, r2.w, r0.xzww, r2
    add r1.xyw, c0.x, v7.xyzz
    mad_pp r1.xyz, c16.w, r1.xyww, r1.z
    mul_pp r0.xyz, r0, r1
    texld_pp r1, v4.yxzw, s9
    mad_pp oC0.xyz, r0, r1.w, r1
    texld_pp r0, v1.zwzw, s5
    mov_pp oC0.w, r0.y

// approximately 91 instruction slots used (8 texture, 83 arithmetic)
