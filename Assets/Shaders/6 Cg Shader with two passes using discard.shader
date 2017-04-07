// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

Shader "Cg Shading in world space" {
    SubShader{
        Pass {
            Cull Front
            
            CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag

                struct vertexInput {
                    float4 vertex : POSITION;
                };

                struct vertexOutput {
                    float4 pos : SV_POSITION;
                    float4 posInObjectsCoords : TEXCOORD0;
                };

                vertexOutput vert(vertexInput input) {
                    vertexOutput output;

                    output.pos = mul(UNITY_MATRIX_MVP, input.vertex);
                    // _Object2World: Objeto uniform já definido pela unity (uniform float4x4)
                    output.posInObjectsCoords = input.vertex;

                    return output;
                }

                float4 frag(vertexOutput input) : COLOR {
                    if (input.posInObjectsCoords.y > 0.0) {
                        discard; // DROP THE FRAGMENT (não renderiza)
                    }

                    return float4(0.0, 1.0, 0.0, 1.0);
                }
            ENDCG
        }

        Pass {
            Cull Back

            CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag

                struct vertexInput {
                    float4 vertex : POSITION;
                };

                struct vertexOutput {
                    float4 pos : SV_POSITION;
                    float4 posInObjectsCoords : TEXCOORD0;
                };

                vertexOutput vert(vertexInput input) {
                    vertexOutput output;

                    output.pos = mul(UNITY_MATRIX_MVP, input.vertex);
                    // _Object2World: Objeto uniform já definido pela unity (uniform float4x4)
                    output.posInObjectsCoords = input.vertex;

                    return output;
                }

                float4 frag(vertexOutput input) : COLOR {
                    if (input.posInObjectsCoords.y > 0.0) {
                        discard; // DROP THE FRAGMENT (não renderiza)
                    }

                    return float4(0.0, 1.0, 0.0, 1.0);
                }
                ENDCG
        }
    }
}