Shader "Other/Surface01" {
	
	SubShader{
		Tags {
			"RenderType"="Transparent"
		}

		CGPROGRAM
		#pragma surface surf Lambert 

		struct Input {
			float4 color : COLOR;
		};

		void surf(Input IN, inout SurfaceOutput o){
			o.Albedo = float4(1, 0, 0, 1);
		}
		ENDCG
	}



	FallBack "Diffuse"
}
