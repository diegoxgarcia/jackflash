class_name InteracTile
extends Node3D

@onready var spot_light_3d = $SpotLight3D
@onready var musical_score_handler = $MusicalScoreHandler
@onready var tile_lighter = $TileLighter

signal turn_off_lights(on : bool)

var rng = RandomNumberGenerator.new()
var interactive_tile_data = InteractiveTileData.new()

var key_color = rng.randi_range(0, interactive_tile_data.tile_color.size() - 1)

func _ready():
	var size = interactive_tile_data.tile_color.size() - 1
	for child in get_child(0).get_children():
		if child is InteractiveTile:
			var random_color = rng.randi_range(0, size)
			child.current_color = random_color
			child.change_color(random_color)
			child.color_changed.connect(_on_interactive_tile_color_changed)
	pass 

func _process(delta):
	pass

func _on_interactive_tile_color_changed(color_index : int):
	if combo_verify():
		musical_score_handler.add_child(preload("res://Scenes/Collectables/musical_score.tscn").instantiate())
		turn_off_lights.emit(false)
		spot_light_3d.visible = false
		for child in get_child(0).get_children():
			if child is InteractiveTile:
				child.disconnect("color_changed", _on_interactive_tile_color_changed)
		tile_lighter.disconnect("illuminate_player", _on_tile_lighter_illuminate_player)
		tile_lighter.disconnect("darken_player", _on_tile_lighter_darken_player)
	pass 

func combo_verify() -> bool:
	var are_equals : bool = true
	var tiles := get_child(0).get_children()
	while not tiles.is_empty():
		var tile := tiles.pop_back() as InteractiveTile
		if tile.current_color == key_color:
			continue
		else:
			are_equals = false
			break
	return are_equals
	pass


func _on_tile_lighter_illuminate_player():
	turn_off_lights.emit(true)
	spot_light_3d.light_color = interactive_tile_data.tile_color[key_color]
	spot_light_3d.visible = true
	await get_tree().create_timer(3).timeout
	spot_light_3d.light_color = Color(Color.TRANSPARENT)
	pass


func _on_tile_lighter_darken_player():
	turn_off_lights.emit(false)
	spot_light_3d.visible = false
	pass 
