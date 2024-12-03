extends CanvasLayer

@onready var buttons_options_container = $Control/Panel/ButtonsOptionsContainer
@onready var audio_panel = $Control/AudioPanel
@onready var audio_container = $Control/AudioPanel/AudioContainer
@onready var continue_button = $Control/Panel/ButtonsOptionsContainer/ContinueButton

var audio_menu : AudioMenu

func _ready():
	audio_menu = AudioMenu.new()
	audio_menu.load_volume(audio_container)
	pass

func _on_exit_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/Menu/game_menu.tscn")
	pass

func _on_audio_button_pressed():
	buttons_options_container.visible = false
	audio_panel.visible = true
	pass

func _on_continue_button_pressed():
	self.visible = false
	get_tree().paused = false
	pass

func _on_back_button_pressed():
	buttons_options_container.visible = true
	audio_panel.visible = false
	GameManager.save_data(GameManager.savefile, GameManager.game_data)	
	pass 

func _on_sfx_audio_slider_value_changed(value):
	audio_menu.on_sfx_volume_changed(value)
	pass 

func _on_music_audio_slider_value_changed(value):
	audio_menu.on_music_volume_changed(value)
	pass 
	
func _on_master_audio_slider_value_changed(value):
	audio_menu.on_master_volume_changed(value)
	pass 
