extends RigidBody3D

@onready var info_action = $InfoAction

func _on_musical_stand_player_detector_player_music_score_entered(body):
	if body.has_musical_score():	
		info_action.text = "Press E Key or B Button"
	pass


func _on_musical_stand_player_detector_player_music_score_exited(body):
	info_action.text = ""
	pass


func _on_musical_stand_player_detector_music_score_entered(area):
	if area.is_in_group("Collectable"):
		area.queue_free()
		print_debug("Agregar el collectable a un contador para compararlo con la cantidad de interactiles que hay")
	pass
