Shader "Other/Surface02" {
	Properties {
		_Maintex ("MainTexture", 2D) = "white" {}
	}

	SubShader {
		Tags { "RenderType" = "Opaque"}

		CGPROGRAM

		#pragma surface surf Lambert

		struct Input{
			float2 uv_Maintex;
		};

		sampler2D  _Maintex;

		void surf (Input IN, inout SurfaceOutput o){
			//float2 newUV = float2(IN.uv_Maintex.x + 0.2, IN.uv_Maintex.y);

			o.Albedo = tex2D(_Maintex, IN.uv_Maintex).rgb;
		}

		ENDCG
	}

	Fallback "Diffuse"
}
