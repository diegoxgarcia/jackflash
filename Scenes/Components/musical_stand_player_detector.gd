extends Area3D

signal player_music_score_entered(body)
signal player_music_score_exited(body)
signal music_score_entered(area)

func _on_body_entered(body):
	player_music_score_entered.emit(body)
	pass 


func _on_body_exited(body):
	player_music_score_exited.emit(body)
	pass 


func _on_area_entered(area):
	if area is MusicalScore:
		music_score_entered.emit(area)
	pass
