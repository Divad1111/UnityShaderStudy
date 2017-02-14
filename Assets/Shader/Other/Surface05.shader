Shader "Other/Surface05" {
	Properties {
		_MainTex ("MainTexture", 2D) = "white" {}
		_BumpTex ("BumpTexture", 2D) = "white" {}
		_Detail ("Detail", 2D) = "" {}		
	}

	SubShader {
		Tags {"RenderType"="Opaque"}

		CGPROGRAM
		#pragma surface surf Lambert

		struct Input {
			float2 uv_MainTex;
			float2 uv_BumpTex;
			float2 uv_Detail;
		};

		sampler2D _MainTex;
		sampler2D _BumpTex;
		sampler2D _Detail;

		void surf (Input i, inout SurfaceOutput o){
			o.Albedo = tex2D (_MainTex, i.uv_MainTex).rgb;
			o.Albedo *= tex2D(_Detail, i.uv_Detail).rgb * 2;
			o.Normal = UnpackNormal(tex2D(_BumpTex, i.uv_BumpTex));
		}


		ENDCG
	}

	Fallback "Diffuse"
}
