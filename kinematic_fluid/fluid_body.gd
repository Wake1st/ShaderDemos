extends RigidBody3D


var prevPosition:Vector3


func _ready():
	prevPosition = global_position


func _physics_process(delta):
	var torque = Vector3.UP.cross(global_position - prevPosition)
	apply_torque(torque)
	prevPosition = global_position
