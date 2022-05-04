extends Area2D

var corazones = load("res://vidas/World.gd").new() #load heredo los metodos del script puesto en la ruta.
# con el new(), instancio.

func _on_corazon2D_body_entered(body):
	queue_free() #cuando un objeto colisione con el corazon, desaparecera.
	corazones.agregar_vida() # llamo al metodo quitar_vida del srcipt cargado en corazones.
	pass 

