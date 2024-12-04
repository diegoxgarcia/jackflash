class_name AudioMenu
extends Control

var vbox_aux : VBoxContainer
@onready var v_box_container = $VBoxContainer

func _ready():
	load_volume(v_box_container)
	pass
		
func _on_back_button_pressed():
	self.hide()
	vbox_aux.show()
	GameManager.save_data(GameManager.savefile, GameManager.game_data)	
	pass
	
func show_and_hide(vbox : VBoxContainer):
	vbox_aux = vbox
	vbox.hide()
	show()
	pass

func _on_master_audio_slider_value_changed(value):
	on_master_volume_changed(value)
	pass

func _on_music_audio_slider_value_changed(value):
	on_music_volume_changed(value)
	pass

func _on_sfx_audio_slider_value_changed(value):
	on_sfx_volume_changed(value)
	pass 
	
func on_master_volume_changed(value : float):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)
	GameManager.game_data.master_volume = value
	pass
	
func on_music_volume_changed(value : float):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), value)
	GameManager.game_data.music_volume = value
	pass
	
func on_sfx_volume_changed(value : float):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), value)
	GameManager.game_data.sfx_volume = value
	pass
	
func load_volume(audio_container : VBoxContainer):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), GameManager.game_data.music_volume)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), GameManager.game_data.sfx_volume)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), GameManager.game_data.master_volume)
	audio_container.get_node("MasterAudioSlider").value = GameManager.game_data.master_volume
	audio_container.get_node("MusicAudioSlider").value = GameManager.game_data.music_volume
	audio_container.get_node("SFXAudioSlider").value = GameManager.game_data.sfx_volume
	pass
