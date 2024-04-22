shader_type spatial;

const int vertex_size = 48;
uniform float[vertex_size] verticies = [
	0.5, 0.0, 0.5
];

void vertex() {
	float layer = floor(VERTEX.y);
	VERTEX.x = verticies[3*VERTEX_ID];
	VERTEX.y = verticies[3*VERTEX_ID + 1];
	VERTEX.z = verticies[3*VERTEX_ID + 2];
}

void fragment() {
	ALBEDO = vec3(0.2,0.2,0.6);
}