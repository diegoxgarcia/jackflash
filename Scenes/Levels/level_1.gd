class_name Level1
extends Node3D

@onready var directional_light_3d = $DirectionalLight3D
@onready var gui_play_screen : GuiPlayerScreen = $GUIPlayScreen
@onready var grid_map = $GridMap
@onready var game_over = $Player/GameOver
@onready var player = $Player
@onready var inside_game_menu = $InsideGameMenu
@onready var animation_player = $AnimationPlayer

var total_musical_scores : int

func _ready():
	total_musical_scores = grid_map.get_children().size()
	gui_play_screen.update_init_scores(total_musical_scores)
	pass
	
func _process(delta : float):
	if Input.is_action_just_pressed("ui_cancel"):
		if player.player_data.life > 0:
			open_menu(false)
		else:
			open_menu(true)
	pass

func _on_interac_tile_turn_off_lights(on):
	directional_light_3d.visible = !on
	pass

func _on_musical_stand_rb_musical_score_collected(color, musical_scores):
	gui_play_screen.update_scores(musical_scores, total_musical_scores, color)
	if musical_scores == total_musical_scores:
		animation_player.play("flash_color_lights")
	pass 

func _on_player_update_life_data(life):
	gui_play_screen.update_lifes(life)
	pass

func _on_player_player_dead():
	player.set_physics_process(false)
	game_over.visible = true
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
			pass
	pass
