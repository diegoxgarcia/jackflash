extends Area3D
signal enemy_take_damage

func _on_area_entered(area: Area3D) -> void:
	enemy_take_damage.emit(area)
	print("el enemigo ha sigo golpeado")
	pass # Replace with function body.
