extends MeshInstance3D

@export_category("Cup Mesh")
@export var height:float = 2.0
@export var radius:float = 1.0
@export var edges:int = 12
@export_range(-PI,PI) var wallAngle:float = 80.0

@onready var material:StandardMaterial3D = preload("res://kinematic_fluid/cup_material.tres")

var meshArr = []

var meshColors = PackedColorArray()
var meshVerticies = PackedVector3Array()
var meshIndicies = PackedInt32Array()


func _ready():
	meshArr.resize(Mesh.ARRAY_MAX)
	
	for i in edges:
		quadWall(i * PI/edges,i*6)
	
	meshArr[Mesh.ARRAY_VERTEX] = meshVerticies
	meshArr[Mesh.ARRAY_INDEX] = meshIndicies
	
	var m:ArrayMesh = ArrayMesh.new()
	m.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, meshArr)
	m.surface_set_material(0,material)
	mesh = null
	mesh = m


func quadWall(edgeAngle:float, quadBaseIndex: int):
	# TODO: needs to be dualwall - have both faces
	var angledRadius = height/2 * sin(wallAngle)
	var angledHeight = height/2 * cos(wallAngle)
	
	var x0:float = (radius - angledRadius) * cos(edgeAngle + edges/(2*PI))
	var x1:float = (radius - angledRadius) * cos(edgeAngle - edges/(2*PI))
	var x2:float = (radius + angledRadius) * cos(edgeAngle - edges/(2*PI))
	var x3:float = (radius + angledRadius) * cos(edgeAngle + edges/(2*PI))
	var z0:float = (radius - angledRadius) * sin(edgeAngle + edges/(2*PI))
	var z1:float = (radius - angledRadius) * sin(edgeAngle - edges/(2*PI))
	var z2:float = (radius + angledRadius) * sin(edgeAngle - edges/(2*PI))
	var z3:float = (radius + angledRadius) * sin(edgeAngle + edges/(2*PI))
	var y0:float = -angledHeight
	var y1:float = -angledHeight
	var y2:float = angledHeight
	var y3:float = angledHeight
	
	meshVerticies.append(Vector3(x0,y0,z0))
	meshIndicies.append(quadBaseIndex + 0)
	meshVerticies.append(Vector3(x2,y2,z2))
	meshIndicies.append(quadBaseIndex + 1)
	meshVerticies.append(Vector3(x1,y1,z1))
	meshIndicies.append(quadBaseIndex + 2)
	meshVerticies.append(Vector3(x0,y0,z0))
	meshIndicies.append(quadBaseIndex + 3)
	meshVerticies.append(Vector3(x3,y3,z3))
	meshIndicies.append(quadBaseIndex + 4)
	meshVerticies.append(Vector3(x2,y2,z2))
	meshIndicies.append(quadBaseIndex + 5)
