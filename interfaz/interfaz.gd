extends CanvasLayer

signal iniciar_juego

func mostrar_mesaje(texto):
	$mensaje.text=texto
	$mensaje.show()
	$mensajeTimer.start()
	
func game_over():
	mostrar_mesaje("GAME OVER")
	yield($mensajeTimer,"timeout")
	$jugar.show()
	$mensaje.text="PROLLECTO ENTORNOS"
	$mensaje.show()
	
func _on_mensajetimer_timeout():
	$mensaje.hide()


func _on_jugar_pressed():
	$jugar.hide()
	$mensaje.hide()
	emit_signal("iniciar_juego")
