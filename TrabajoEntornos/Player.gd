extends KinematicBody2D

const vel = 25
const velMax = 50

const salto = -300
const up = Vector2(0,-1)
const gravedad = 15

onready var sprite = $Sprite
onready var animation = $AnimationPlayer

var motion = Vector2(0,-1)

func _physics_process(delta): #ComprobaciÃ³n infinita
	motion.y += gravedad
	var friction = false
	if Input.is_action_pressed("ui_right"):
		sprite.flip_h = false
		animation.play("Walk")
		motion.x = min(motion.x + vel, velMax)
	elif Input.is_action_pressed("ui_left"):
		sprite.flip_h = true
		animation.play("Walk")
		motion.x = max(motion.x -vel, -velMax) #para hacer el giro menos repentino
	else:
		animation.play("Idle")
		friction = true
		
	if is_on_floor():
		if Input.is_action_pressed("ui_accept"):
			motion.y = salto
		if friction == true:
			motion.x = lerp(motion.x ,0,0.5) #transiciona de velx a 0 un 50% por frame
			
	else:
		if friction == true:
			motion.x = lerp(motion.x ,0,0.01)
			
	motion = move_and_slide(motion,up)
