class_name GuiPlayerScreen
extends CanvasLayer

@onready var life_frame_1 = $UI/PlayerInfoBox/HBoxContainer/LifeFrame1
@onready var life_frame_2 = $UI/PlayerInfoBox/HBoxContainer/LifeFrame2
@onready var life_frame_3 = $UI/PlayerInfoBox/HBoxContainer/LifeFrame3
@onready var score_left_amount : Label = $UI/GameInfoBox/VBoxContainer2/ScoreLeftAmount
@onready var score_taken_amount : Label = $UI/GameInfoBox/VBoxContainer2/ScoreTakenAmount
@onready var music_score_avatar = $UI/GameInfoBox/MusicScoreAvatar
@onready var elvio_avatar_frame = $UI/PlayerInfoBox/ElvioAvatarFrame

signal transition_next_level

func _process(delta):
	pass
	
func update_lifes(life : int):
	elvio_avatar_frame.flicker_damage_elvio()
	match life:
		0:
			life_frame_1.lost_life_1()
		1:
			life_frame_2.lost_life_2()
		2:
			life_frame_3.lost_life_3()
	pass
			
func update_init_scores(level_score : int):
	score_left_amount.text = str(level_score)
	pass
	
func update_scores(musical_stand_score : int, level_score : int, color : Color):
	score_left_amount.text = str(level_score - musical_stand_score)
	score_taken_amount.text = str(musical_stand_score)
	music_score_avatar.flicker_score(color)
	pass
	


func _on_trans_animation_player_animation_finished(anim_name):
	match anim_name:
		"fade_in":
			transition_next_level.emit()
	pass
