extends CharacterBody3D

@export_category("Player")
@export var speed = 15.0
@export var accel = 10.0


func _physics_process(delta):
	var Vy = velocity.y
	velocity.y = 0
	var input = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	var dir = Vector3(input.x,0,input.y)
	velocity = lerp(velocity, dir * speed, accel * delta)
	velocity.y = Vy
	
	move_and_slide()
