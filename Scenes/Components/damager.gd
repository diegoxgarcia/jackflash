extends Area3D

signal player_damaged

func _on_area_entered(area):
	player_damaged.emit()
	pass
