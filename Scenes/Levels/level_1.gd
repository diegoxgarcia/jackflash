class_name Level1
extends Node3D

@onready var directional_light_3d = $DirectionalLight3D
@onready var gui_play_screen : GuiPlayerScreen = $GUIPlayScreen
@onready var grid_map = $GridMap

func _ready():
	gui_play_screen.update_init_scores(grid_map.get_children().size())
	pass

func _on_interac_tile_turn_off_lights(on):
	directional_light_3d.visible = !on
	pass

func _on_musical_stand_rb_musical_score_collected(color, musical_scores):
	gui_play_screen.update_scores(musical_scores, grid_map.get_children().size(), color)
	pass 

func _on_player_update_life_data(life):
	gui_play_screen.update_lifes(life)
	pass
