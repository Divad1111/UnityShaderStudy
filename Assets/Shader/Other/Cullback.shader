Shader "Other/Show Insides" {
	Properties {
		_tin ("Tin", Color) = (1, 1, 1, 1)
	}

    SubShader {
		Name "test"
		Lighting On
		

        Pass {
		Cull Off
            Material {
                Diffuse [_tin]
            }
			
        }
    }
}