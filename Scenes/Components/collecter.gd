extends Area3D

signal player_collected(area)
signal player_uncollected(area)

func _on_area_entered(area):
	player_collected.emit(area)
	pass 


func _on_area_exited(area):
	player_uncollected.emit(area)
	pass
