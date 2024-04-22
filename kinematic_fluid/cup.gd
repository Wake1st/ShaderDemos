extends Node3D

@onready var fluid_mesh = $FluidMesh

var previousPosition:Vector3


func _ready():
	previousPosition = global_position


func _physics_process(_delta):
	if global_position != previousPosition:
		var displacement:Vector3 = global_position - previousPosition
		fluid_mesh.mesh.material.set_shader_parameter("disp", Vector2(displacement.x,displacement.z))
		previousPosition = global_position
		
		print("disp: %v" % Vector2(displacement.x,displacement.z))
