extends Node3D

#const Grav:float = 1.0
@export_category("Fluid Mess")
@export var coef:float = 0.00000001
@export var mass:float = 0.00004
@export var damp:float = 1

@onready var fluid_mesh = $FluidMesh

var previousDisplacements:Array[Vector2]
var previousAccelerations:Array[Vector2]

var prevPosition:Vector3
#var prevVel:Vector3
#var prevAcc:Vector3


#func _ready():
	#prevPosition = global_position
	##prevVel = Vector3.ZERO
	##prevAcc = Vector3.ZERO
#
#
#func _physics_process(_delta):
	##fluid_mesh.mesh.material.set_shader_parameter("delta", delta)
	#
	##var deltaPos:Vector3 = global_position - prevPosition + prevVel*delta + prevAcc*delta*delta
	#
	##var deltaPos:Vector3 = 2.4*(global_position - prevPosition) - damp*prevVel - mass*prevAcc
	##var deltaVel:Vector3 = deltaPos/delta
	##var deltaAcc:Vector3 = deltaVel/delta
	#
	#var currentDisplacement3D:Vector3 = global_position - prevPosition
	#var currentDisplacement:Vector2 = Vector2(currentDisplacement3D.x,currentDisplacement3D.z)
	#var netDisplacement:Vector2 = calculate_net_displacement(currentDisplacement)
	#
	#fluid_mesh.mesh.material.set_shader_parameter("disp", netDisplacement)
	##fluid_mesh.mesh.material.set_shader_parameter("deltaVel", Vector2(deltaVel.x,deltaVel.z))
	##fluid_mesh.mesh.material.set_shader_parameter("deltaAcc", Vector2(deltaAcc.x,deltaAcc.z))
	#
	#prevPosition = global_position
	#previousDisplacements.push_front(currentDisplacement)
	#previousAccelerations.push_front(get_acceleration(currentDisplacement))
	#
	##prevAcc += deltaAcc
	##prevVel += deltaVel
	#
	## we don't want the array to get too large
	#if previousDisplacements.size() > 600:
		#previousDisplacements.pop_back()
		#previousAccelerations.pop_back()
#
#
#func calculate_net_displacement(newDisplacement:Vector2) -> Vector2:
	#var netDisplacement:Vector2 = newDisplacement
	#
	#for acc in previousAccelerations:
		## apply the spring dampening equation
		#var disp = get_displacement(acc)
		#netDisplacement += disp * damp
	#
	#return netDisplacement
#
#
#func get_acceleration(displacement:Vector2) -> Vector2:
	#return -coef/mass * displacement
#
#
#func get_displacement(acceleration:Vector2) -> Vector2:
	#return mass/coef * acceleration
