shader_type spatial;

void vertex() {
	// Called for every vertex the material is visible on.
	vec4 colors = vec4(0,0,0,0);
	COLOR = colors;
}

void fragment() {
	// Called for every pixel the material is visible on.
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
