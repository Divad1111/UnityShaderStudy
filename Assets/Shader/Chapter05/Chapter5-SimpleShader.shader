// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Unity Shaders Book/Chapter5/SimpleShader" {
	Properties{
	_Color ("Color Tint", Color) = (1.0, 1.0, 1.0, 1.0)
	}

	SubShader{
		Name "Chapter5-ss"
		//ZTest GEqual
	
		Pass{

			CGPROGRAM
		
			#pragma vertex vert
			#pragma fragment frag

			fixed4 _Color;

			struct a2v{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
				float4 texcoord : TEXCOORD0;
			};

			struct v2f {
				float4 pos : SV_POSITION;
				float3 color : COLOR0;
				float4 texcoord : TEXCOORD0;
			};

			v2f vert (a2v v) {
				v2f o;
				o.pos = UnityObjectToClipPos(v.vertex);
				o.color = v.normal * 0.5 + fixed3(0.5, 0.5, 0.5);
				return o;
			}

			bool isInCircle(float3 pos, float3 centerPos, float raduis) {
				return length(pos - centerPos) <= raduis;
			}

			fixed4 frag(v2f i) : SV_Target{
				/*fixed3 c = i.color;
				c *= _Color.rgb;
				return fixed4(c, 1.0);*/

				if (isInCircle(float3(0.1, 0.1, 0.1), float3(0, 0, 0), 0.001)) {
					return fixed4(1.0, 0, 0, 1.0);
				}
				else {
					return fixed4(0, 0, 1.0, 1.0);
				}
			}


			ENDCG
		}
	}
	FallBack "Diffuse"
}
