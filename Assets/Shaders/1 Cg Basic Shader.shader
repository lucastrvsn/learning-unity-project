Shader "Cg Basic Shader" {
    SubShader {
        Pass {
            CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag

                // Vert lida com as vertices de um objeto!
                float4 vert(float4 vertexPos : POSITION) : SV_POSITION {
                    return mul(UNITY_MATRIX_MVP, float4(1.0, 1.0, 1.0, 1.0) * vertexPos);
                }

                // Frag lida com as cores/iluminação de um objeto!
                float4 frag(void) : COLOR {
                    return float4(1.0, 1.0, 0.0, 1.0);
                }
//TODO: ASDASD
//BUG: TESTANDO
//FIXME: OI
            ENDCG
        }
    }
}