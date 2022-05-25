extends Area2D

# var corazones = load("res://vidas/World.gd").new() #load heredo los metodos del script puesto en la ruta.
# con el new(), instancio.
onready var collission_shape: CollisionShape2D = get_node("CollisionShape2D")
onready var tween: Tween = get_node("Tween")

func _on_corazon2D_body_entered(player: KinematicBody2D) -> void:
	collission_shape.set_deferred("disabled", true)
	player.health += 15
	var prueba = tween.interpolate_property(self, "modulate", Color(1, 1, 1, 1), 
	Color(1, 1, 1, 1), 0,6, Tween.TRANS_SINE, Tween.EASE_IN)
	assert(prueba)
	prueba = tween.interpolate_property(self, "position", position, position + Vector2.UP * 16, 0,6, Tween.TRANS_SINE,
	Tween.EASE_IN)
	assert(prueba)
	prueba = tween.start()
	assert(prueba)

	# player.health =  player.health + 15
	# corazones.agregar_vida() # llamo al metodo quitar_vida del srcipt cargado en corazones.
	 



func _on_Tween_tween_completed(_object: Object, _key: NodePath) -> void:
	queue_free() #cuando un objeto colisione con el corazon, desaparecera.
