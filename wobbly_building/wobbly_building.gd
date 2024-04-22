extends StaticBody3D

@onready var shader : ShaderMaterial = $MeshInstance3D.get_active_material(0)

var offset = Vector3(0.0,0.0,0.0)
var verticies_size = 16 * 3;

@export var wobble_rate = 0.2
@onready var countdown = wobble_rate;

#
#func _ready():
#




#func _process(_delta):
##	countdown -= delta
##	if (countdown < 0.0):
##		countdown = wobble_rate
#
#	if (Input.is_action_just_pressed("do_something")):
#		var offset_range = Vector3(0.4, 0.1, 0.4)
#		offset = Vector3(
#			randf_range(-offset_range.x, offset_range.x),
#			randf_range(0.0, offset_range.y),
#			randf_range(-offset_range.z, offset_range.z),
#		)
#
#		var verticies = shader.get_shader_parameter("vertex_offset")
#		for i in verticies_size:
#			if i != 0:
#				var layer = floor(i/4)
#				verticies[3*i + 0] += offset.x * layer
#				verticies[3*i + 1] += offset.y + 2.0
#				verticies[3*i + 2] += offset.z * layer
#
#
#	shader.set_shader_parameter("vertex_offset", offset)
