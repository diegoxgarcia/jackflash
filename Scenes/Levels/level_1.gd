class_name Level1
extends Node3D

@onready var directional_light_3d = $DirectionalLight3D
@onready var gui_play_screen : GuiPlayerScreen = $GUIPlayScreen
@onready var grid_map = $GridMap
@onready var game_over = $Player/GameOver
@onready var player = $Player
@onready var inside_game_menu = $InsideGameMenu
@onready var animation_player = $AnimationPlayer
@onready var switch_on = $SFX/SwitchOn
@onready var boss_come = $SFX/BossCome
@onready var music : AudioStreamPlayer = $Music/Music
@onready var game_over_theme = $Music/GameOverTheme
@onready var music_stream : AudioStreamSynchronized = music.stream
@onready var enemy_boss = $Enemies/EnemyBoss
@onready var trans_animation_player = $GUIPlayScreen/Fade/TransAnimationPlayer

var mute_stream_volume = -80
var total_musical_scores : int

func _ready():
	trans_animation_player.play("fade_out")
	enemy_boss.set_physics_process(false)
	total_musical_scores = grid_map.get_children().size()
	mute_all_not_first()
	gui_play_screen.update_init_scores(total_musical_scores)
	pass
	
func mute_all_not_first():
	music_stream.set_sync_stream_volume(0, GameManager.game_data.music_volume)
	music_stream.set_sync_stream_volume(1, mute_stream_volume)
	music_stream.set_sync_stream_volume(2, mute_stream_volume)
	music_stream.set_sync_stream_volume(3, mute_stream_volume)
	music_stream.set_sync_stream_volume(4, mute_stream_volume)
	music_stream.set_sync_stream_volume(5, mute_stream_volume)
	pass
	
func unmute_stream(index : int):
	music_stream.set_sync_stream_volume(index, GameManager.game_data.music_volume)
pass

func _process(delta : float):
	if Input.is_action_just_pressed("ui_cancel"):
		if player.player_data.life > 0:
			open_menu(false)
		else:
			open_menu(true)
	pass

func _on_interac_tile_turn_off_lights(on):
	switch_on.play()	
	AudioServer.set_bus_effect_enabled(1, 0, on)
	directional_light_3d.visible = !on
	pass

func _on_musical_stand_rb_musical_score_collected(color, musical_scores):
	gui_play_screen.update_scores(musical_scores, total_musical_scores, color)
	unmute_stream(musical_scores)
	if musical_scores == total_musical_scores:
		boss_come.play()
		animation_player.play("flash_color_lights")
	pass 

func _on_player_update_life_data(life):
	gui_play_screen.update_lifes(life)
	pass

func _on_player_player_dead():
	player.set_physics_process(false)
	game_over.visible = true
	music.stop()
	game_over_theme.play()
	game_over.init_animation()
	pass

func open_menu(game_over : bool):
	get_tree().paused = true
	inside_game_menu.visible = true
	if game_over:
		inside_game_menu.continue_button.visible = false
	pass


func _on_animation_player_animation_finished(anim_name):
	match anim_name:
		"flash_color_lights":
			create_boss()
			pass
	pass

func create_boss():
	enemy_boss.set_physics_process(true)
	enemy_boss.visible = true
	pass

func _on_music_finished():
	music.play()
	pass 


func _on_enemy_boss_boss_dead():
	trans_animation_player.play("fade_in")
	pass


func _on_trans_animation_player_animation_finished(anim_name):
	match anim_name:
		"fade_in":
			var next_level = GameManager.get_next_level(self.name.to_lower())
			get_tree().change_scene_to_file(next_level)
	pass
