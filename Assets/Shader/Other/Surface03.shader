Shader "Other/Surface03" {
	Properties {
		_MainTex ("MainTexture", 2D) = "white" {}
		_BumpTex ("BumpTexture", 2D) = "white" {}
	}

	SubShader {
		Tags {"RenderType"="Opaque"}

		CGPROGRAM
		#pragma surface surf Lambert

		struct Input {
			float2 uv_MainTex;
			float2 uv_BumpTex;
		};

		sampler2D _MainTex;
		sampler2D _BumpTex;

		void surf (Input IN, inout SurfaceOutput o){
			o.Albedo = tex2D (_MainTex, IN.uv_MainTex).rgb;
			o.Normal = UnpackNormal(tex2D(_BumpTex, IN.uv_BumpTex));
		}


		ENDCG
	}

	Fallback "Diffuse"
}
