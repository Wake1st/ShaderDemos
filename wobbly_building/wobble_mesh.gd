extends MeshInstance3D

var meshArr = []

var meshColors = PackedColorArray()
var meshVerticies = PackedVector3Array()
var meshIndicies = PackedInt32Array()

func _ready():
	meshArr.resize(Mesh.ARRAY_MAX)
	
	var levels: int = 4
	for i in levels:
		quadWall(i*2+1, Vector3.BACK, 24*i+0)
		quadWall(i*2+1, Vector3.RIGHT, 24*i+6)
		quadWall(i*2+1, Vector3.FORWARD, 24*i+12)
		quadWall(i*2+1, Vector3.LEFT, 24*i+18)
	quadRoof(levels*2-1, 24*levels)
	
	meshArr[Mesh.ARRAY_VERTEX] = meshVerticies
	meshArr[Mesh.ARRAY_INDEX] = meshIndicies
	
	self.mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, meshArr)


func quadWall(height: int, faceNormal: Vector3, quadBaseIndex: int):
	var posX = faceNormal.x == 1
	var posZ = faceNormal.z == 1
	var negX = faceNormal.x == -1
	var negZ = faceNormal.z == -1
	
	var x0: int = 1 if negZ or posX else -1 
	var x1: int = 1 if negZ or posX else -1
	var x2: int = 1 if posX or posZ else -1
	var x3: int = 1 if posX or posZ else -1
	var z0: int = 1 if posX or posZ else -1
	var z1: int = 1 if posX or posZ else -1
	var z2: int = 1 if negX or posZ else -1
	var z3: int = 1 if negX or posZ else -1
	var y0: int = 1 * height - 2
	var y1: int = 1 * height
	var y2: int = 1 * height - 2
	var y3: int = 1 * height
	
	meshVerticies.append(Vector3(x0,y0,z0))
	meshIndicies.append(quadBaseIndex + 0)
	meshVerticies.append(Vector3(x1,y1,z1))
	meshIndicies.append(quadBaseIndex + 1)
	meshVerticies.append(Vector3(x2,y2,z2))
	meshIndicies.append(quadBaseIndex + 2)
	meshVerticies.append(Vector3(x3,y3,z3))
	meshIndicies.append(quadBaseIndex + 3)
	meshVerticies.append(Vector3(x2,y2,z2))
	meshIndicies.append(quadBaseIndex + 4)
	meshVerticies.append(Vector3(x1,y1,z1))
	meshIndicies.append(quadBaseIndex + 5)


func quadRoof(height: int, quadBaseIndex: int):
	meshVerticies.append(Vector3( 1,height,-1))
	meshIndicies.append(quadBaseIndex + 0)
	meshVerticies.append(Vector3(-1,height,-1))
	meshIndicies.append(quadBaseIndex + 1)
	meshVerticies.append(Vector3( 1,height, 1))
	meshIndicies.append(quadBaseIndex + 2)
	meshVerticies.append(Vector3(-1,height, 1))
	meshIndicies.append(quadBaseIndex + 3)
	meshVerticies.append(Vector3( 1,height, 1))
	meshIndicies.append(quadBaseIndex + 4)
	meshVerticies.append(Vector3(-1,height,-1))
	meshIndicies.append(quadBaseIndex + 5)
