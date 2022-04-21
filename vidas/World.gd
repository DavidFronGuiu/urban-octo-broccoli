extends Node2D

var vidas_j1 =3
var offset_vidas=80
var lista_vidas=[]
export (PackedScene) var Sprite_hp

func _ready():
	crear_vidas()

func crear_vidas():
	for i in vidas_j1:
		var newVida=Sprite_hp.instance()
		get_tree().get_nodes_in_group("gui")[0].add_child(newVida)
		newVida.global_position.x+=offset_vidas*i
		lista_vidas.append(newVida)
		
func quitar_vida():
	vidas_j1-=1
	lista_vidas[vidas_j1].queue_free()
	
func agregar_vida():
	vidas_j1 +=1
	var newVida=Sprite_hp.instance()
	get_tree().get_nodes_in_group("gui")[0].add_child(newVida)
	newVida.global_position.x+=offset_vidas*(vidas_j1-1)
	lista_vidas[vidas_j1-1].append(newVida)

		
		
		
