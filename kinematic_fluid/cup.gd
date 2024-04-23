extends Node3D

#const Grav:float = 1.0
@export_category("Fluid Mess")
@export var damp:float = 0.0000001
@export var mass:float = 0.00004

@onready var fluid_mesh = $FluidMesh

var prevPos:Vector3
var prevVel:Vector3
var prevAcc:Vector3


func _ready():
	prevPos = global_position
	prevVel = Vector3.ZERO
	prevAcc = Vector3.ZERO


func _physics_process(delta):
	if global_position != prevPos:
		fluid_mesh.mesh.material.set_shader_parameter("delta", delta)
		
		#var deltaPos:Vector3 = global_position - prevPos + prevVel*delta + prevAcc*delta*delta
		
		var deltaPos:Vector3 = 2.4*(global_position - prevPos) - damp*prevVel - mass*prevAcc
		var deltaVel:Vector3 = deltaPos/delta
		var deltaAcc:Vector3 = deltaVel/delta
		
		fluid_mesh.mesh.material.set_shader_parameter("deltaPos", Vector2(deltaPos.x,deltaPos.z))
		#fluid_mesh.mesh.material.set_shader_parameter("deltaVel", Vector2(deltaVel.x,deltaVel.z))
		#fluid_mesh.mesh.material.set_shader_parameter("deltaAcc", Vector2(deltaAcc.x,deltaAcc.z))
		
		prevAcc += deltaAcc
		prevVel += deltaVel
		prevPos = global_position
