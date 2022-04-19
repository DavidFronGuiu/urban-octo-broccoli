extends Area2D

export (PackedScene) var Shoot

onready var player : KinematicBody2D = get_tree().get_nodes_in_group("Player")[0] # Referencias al nodo player.
var motion : float

func _ready():
	$AnimatedSprite.play("Idle")


func _process(_delta) -> void:
	motion_ctrl()
	tween_ctrl()


func _input(event):
	if event.is_action_pressed("shoot"):
		shoot_ctrl()


func motion_ctrl() -> void:
	if player.get_node("Sprite").flip_h:
		scale.x = -1
		motion = player.global_position.x + 22
	else:
		scale.x = 1
		motion = player.global_position.x - 22


func tween_ctrl() -> void:
	$Tween.interpolate_property(
		self, # Objeto afectado.
		"global_position", # Propiedad afectada. 
		global_position, # Valor inicial.
		Vector2(motion, player.global_position.y - 8), # Valor final.
		0.2, # Tiempo que transcurre entre uno y otro.
		Tween.TRANS_SINE, # Transición inicial.
		Tween.EASE_OUT # Transición final.
	)
	$Tween.start()


func shoot_ctrl():
	var shoot = Shoot.instance()
	shoot.global_position = $ShootSpawn.global_position
	
	if player.get_node("Sprite").flip_h:
		shoot.scale.x = -1
		shoot.direction = -224
	else:
		shoot.scale.x = 1
		shoot.direction = 224
	
	get_tree().call_group("Level", "add_child", shoot)
