extends Area3D

signal illuminate_player
signal darken_player

func _on_body_entered(body):
	if body.is_in_group("Player"):
		illuminate_player.emit()
	pass


func _on_body_exited(body):
	if body.is_in_group("Player"):
		darken_player.emit()
	pass
