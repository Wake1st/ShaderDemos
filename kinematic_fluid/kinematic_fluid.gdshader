shader_type spatial;
render_mode wireframe;

const float angleFreq = 0.01;
const float dampRatio = 0.02;
const float velCoeff = 2.0*dampRatio*angleFreq;
const float disCoeff = angleFreq*angleFreq;

const vec2 origin = vec2(0.0,0.0);

uniform float delta = 0.0;
uniform vec2 deltaPos = vec2(0.0,0.0);
uniform vec2 deltaVel = vec2(0.0,0.0);
uniform vec2 deltaAcc = vec2(0.0,0.0);

void vertex() {
	//	check out Driven Harmonic Oscillators (https://en.wikipedia.org/wiki/Harmonic_oscillator#:~:text=.-,Driven%20harmonic%20oscillators,-%5Bedit%5D)
	//float spring_disp = 1.0/(1.0/(delta*delta) + velCoeff/delta + disCoeff);
	//float spring_disp = -VERTEX.y * delta*delta/(disCoeff) * (1.0 + velCoeff*delta);
	
	float magnitude = distance(deltaPos,origin);
	
	vec2 unitDisp = normalize(deltaPos);
	vec2 unitVert = vec2(VERTEX.x,VERTEX.z);
	float closeness = dot(unitDisp,unitVert);
	
	VERTEX.y = -closeness * magnitude;
}

void fragment() {
	ALBEDO = vec3(0.0,0.9,0.3);
	ALPHA = 0.2;
}
