extends KinematicBody2D

const vel = 35
const velMax = 75
const salto = -550
const up = Vector2(0,-1)
const gravedad = 15
signal hp_changed(hp)

const DISPARO = preload("res://Shoot.tscn")
export var pixelesPorSegundos : int = 180
export(int) var hp: int = 100 setget set_hp
export(int) var max_hp: int =  100
var otro = -1
var tiempoDisparo= 0.5
var tiempoCadaDisparo = 0.5
export var health : int = 100   
onready var sprite = $Sprite
onready var animation = $AnimationPlayer
onready var hitbox = $Hitbox

var motion = Vector2(0,-1)

			
func damage_player(damage):
		health -= damage
	
func _on_Hurtbox_area_entered(area):
		if area.get_parent().is_in_group("enemy"):
			damage_player(area.get_parent().damage)
		pass
		
func _physics_process(delta): 
	
	motion.y += gravedad
	
	tiempoDisparo += delta
	
	_get_input()
	
	
func _get_input()-> void:
	
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

func _process(delta):
	tiempoDisparo += delta
	if Input.is_key_pressed(KEY_Q):
		disparar()
	
func disparar():
	var disparo = DISPARO.instance()
	
	if tiempoDisparo >= tiempoCadaDisparo:
		tiempoDisparo = 0
		disparo.position = position
		get_parent().add_child(disparo)
		pass

func set_hp(new_hp: int) -> void:
	hp = clamp(new_hp, 0, max_hp)
	emit_signal("hp_changed", hp)
