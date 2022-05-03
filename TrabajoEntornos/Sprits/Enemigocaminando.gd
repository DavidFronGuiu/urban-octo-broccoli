extends KinematicBody2D

const speed : float = 25.0
# velocidad de desplazamiento 
const gravity : float = 25.0
# gravedad por si queremos que caiga

var motion := Vector2() 

var direccion = -1
#dirección de movimiento del personaje

func _ready():
	
	
	motion.x = speed * direccion
	pass
	

func _next_to_left_wall() -> bool:
	return $leftRay.is_colliding()


func _process(delta):
	motion = move_and_slide (motion)
	pass
