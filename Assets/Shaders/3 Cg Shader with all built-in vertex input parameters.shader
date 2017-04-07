Shader "Cg Shader with all built-in vertex input parameters" {
    SubShader{
        Pass {
            CGPROGRAM

                #pragma vertex vert
                #pragma fragment frag

                // Esse include possui structs já definidas pela Unity para as utilizações mais comuns,
                //  como: appdata_base, appdata_tan, appdata_full, appdata_img.
                #include "UnityCG.cginc"

                // Essa struct é semelhante a struct appdata_full provida pela Unity.
                struct vertexInput {
                    float4 vertex : POSITION;
                    float4 tangent : TANGENT;
                    float3 normal : NORMAL; // FLOAT 3
                    float4 texcoord0 : TEXCOORD0;
                    float4 texcoord1 : TEXCOORD1;
                    float4 texcoord2 : TEXCOORD2;
                    float4 texcoord3 : TEXCOORD3;
                    fixed4 color : COLOR; // FIXED 4
                };

                struct vertexOutput {
                    float4 pos : SV_POSITION;
                    float4 col : TEXCOORD0;
                };

                vertexOutput vert(appdata_full input) {
                    vertexOutput output;
                    output.pos = mul(UNITY_MATRIX_MVP, input.vertex);
                    output.col = float4((input.normal + float3(1.0, 1.0, 1.0)) / 1.5, 1.0);
                    return output;
                }

                float4 frag(vertexOutput input) : COLOR {
                    return input.col;
                }

            ENDCG
        }
    }
}