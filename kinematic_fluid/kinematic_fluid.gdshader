shader_type spatial;
render_mode unshaded;

const vec2 origin = vec2(0.0,0.0);

uniform vec2 disp = vec2(0.0,0.0);

void vertex() {
	float magnitude = distance(disp,origin);
	
	vec2 unitDisp = normalize(disp);
	vec2 unitVert = vec2(VERTEX.x,VERTEX.z);
	float closeness = dot(unitDisp,unitVert);
	
	//VERTEX.y = -closeness;
	//VERTEX.y = magnitude;
	VERTEX.y = -closeness * magnitude;
}

void fragment() {
	ALBEDO = vec3(0.0,0.9,0.3);
	ALPHA = 0.2;
}
