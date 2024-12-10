extends Area3D

signal attacking

func _on_area_entered(area):
	attacking.emit()
	pass
