Shader "Other/Show Insides" {
	Properties {
		_tin ("Tin", Color) = (1, 1, 1, 1)
	}

    SubShader {
        Pass {
            Material {
                Diffuse (1,0,0, 1)
            }
            Lighting On
            Cull Front
        }
    }
}