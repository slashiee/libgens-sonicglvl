//
// Generated by Microsoft (R) HLSL Shader Compiler 9.29.952.3111
//
// Parameters:
//
//   row_major float4x4 g_Mtx;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   g_Mtx        c246     4
//

    vs_3_0
    def c0, 0, 0, 0, 0
    dcl_position v0
    dcl_color v1
    dcl_color1 v2
    dcl_texcoord v3
    dcl_texcoord1 v4
    dcl_position o0
    dcl_color o1
    dcl_color1 o2
    dcl_texcoord o3
    mul r0, c247, v0.y
    mad r0, v0.x, c246, r0
    mad r0, v0.z, c248, r0
    add o0, r0, c249
    mul o2.xyz, v2.z, v2.wxyw
    mov o1, v1.wxyz
    mov o2.w, c0.x
    mov o3.xy, v3
    mov o3.zw, v4.xyxy

// approximately 9 instruction slots used