extends RigidBody3D

@onready var info_action = $InfoAction
@export var music_stand_data : MusicStandData
@onready var music_stand_particles = $MusicStandParticles

signal musical_score_collected(color : Color, musical_scores : int)

func _on_musical_stand_player_detector_player_music_score_entered(body):
	if body.has_musical_score():	
		info_action.text = "Press E Key or B Button"
	pass


func _on_musical_stand_player_detector_player_music_score_exited(body):
	info_action.text = ""
	pass


func _on_musical_stand_player_detector_music_score_entered(area : MusicalScore):
	if area.is_in_group("Collectable"):
		music_stand_data.musical_scores = music_stand_data.musical_scores +  1
		musical_score_collected.emit(area.tile_color, music_stand_data.musical_scores)
		music_stand_particles.emitting = true
		area.queue_free()
	pass
