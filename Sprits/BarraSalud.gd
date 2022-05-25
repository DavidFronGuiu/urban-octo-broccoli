extends CanvasLayer

export (NodePath) var player_node
onready var player = get_node(player_node) # ahora podremos acceder a todas la variables del player

func _process(_delta):
	$TextureProgress.value = player.health
