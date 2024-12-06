extends Area3D
signal enemy_take_damage

func _on_area_entered(area: Area3D) -> void:
	enemy_take_damage.emit(area)
	pass
