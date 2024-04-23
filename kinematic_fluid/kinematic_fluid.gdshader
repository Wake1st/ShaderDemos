shader_type spatial;
render_mode wireframe;

const float angleFreq = 0.001;
const float dampRatio = 0.002;
const float velCoeff = 2.0*dampRatio*angleFreq;
const float disCoeff = angleFreq*angleFreq;

const vec2 origin = vec2(0.0,0.0);

uniform vec2 disp = vec2(0.0,0.0);
uniform float delta = 0.0;

void vertex() {
	//float spring_disp = 1.0/(1.0/(delta*delta) + velCoeff/delta + disCoeff);
	float spring_disp = -VERTEX.y * delta*delta/(disCoeff) * (1.0 + velCoeff*delta);
	
	float magnitude = distance(disp,origin) + spring_disp;
	
	vec2 unitDisp = normalize(disp);
	vec2 unitVert = vec2(VERTEX.x,VERTEX.z);
	float closeness = dot(unitDisp,unitVert);
	
	VERTEX.y = -closeness * magnitude;
}

void fragment() {
	ALBEDO = vec3(0.0,0.9,0.3);
	ALPHA = 0.2;
}
