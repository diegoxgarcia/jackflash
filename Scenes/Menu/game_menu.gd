extends Control

@onready var audio_menu = $AudioMenu
@onready var v_box_container = $VBoxContainer
@onready var credits_menu = $CreditsMenu
@onready var how_to_play_menu = $HowToPlayMenu
@onready var recommends_label = $RecommendsLabel

func _on_start_game_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/level_1.tscn")
	pass

func _on_audio_button_pressed():
	audio_menu.show_and_hide(v_box_container, recommends_label)
	pass 

func _on_how_to_play_button_pressed():
	how_to_play_menu.show_and_hide(v_box_container, recommends_label)
	pass 

func _on_credit_button_pressed():
	credits_menu.show_hide_play(v_box_container, recommends_label)
	pass 
