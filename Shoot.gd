extends Area2D

var pixelesPorSegundos : int = 180


func _ready() -> void:
	pass
	

func _process(delta) -> void:
	
	position.x += pixelesPorSegundos * delta
	
	if position.x > 5000:
		queue_free()


