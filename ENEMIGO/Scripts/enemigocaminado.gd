extends KinematicBody2D


var speed = 100

var velocity = Vector2()

var direction = -1

var damage = 1

func _ready():
	
	set_physics_process(true)
	
	pass
	
func _physics_process(delta):
	
	if(!test_move(Transform2D(0, Vector2(position.x + 64 * direction, position.y)), Vector2 (0, 32))):
	
		direction *= -1
		
	move_and_slide(Vector2(speed * direction, 0))
