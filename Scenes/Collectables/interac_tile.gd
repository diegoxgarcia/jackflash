class_name InteracTile
extends Node3D

@onready var spot_light_3d = $SpotLight3D
@onready var musical_score_handler = $MusicalScoreHandler
@onready var tile_lighter = $TileLighter
@onready var switch_on = $SFX/SwitchOn
@onready var switch_off = $SFX/SwitchOff
@onready var musical_score_appears = $SFX/MusicalScoreAppears
@onready var info_action = $InfoAction

signal turn_off_lights(on : bool)

var rng = RandomNumberGenerator.new()
var interactive_tile_data = InteractiveTileData.new()

var key_color = rng.randi_range(0, interactive_tile_data.tile_color.size() - 1)

func _ready():
	var size = interactive_tile_data.tile_color.size() - 1
	for child in get_node("Tiles").get_children():
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
		var musical_score = preload("res://Scenes/Collectables/musical_score.tscn").instantiate()
		musical_score.tile_color = interactive_tile_data.tile_color[color_index]
		musical_score_handler.add_child(musical_score)
		turn_off_lights.emit(false)
		musical_score_appears.play()
		switch_on.play()
		spot_light_3d.visible = false
		for child in get_node("Tiles").get_children():
			if child is InteractiveTile:
				child.disconnect("color_changed", _on_interactive_tile_color_changed)
		tile_lighter.disconnect("illuminate_player", _on_tile_lighter_illuminate_player)
		tile_lighter.disconnect("darken_player", _on_tile_lighter_darken_player)
	pass 

func combo_verify() -> bool:
	var are_equals : bool = true
	var tiles := get_node("Tiles").get_children()
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
	info_action.show()
	await get_tree().create_timer(3).timeout
	info_action.hide()
	spot_light_3d.light_color = Color(Color.TRANSPARENT)
	switch_off.play()
	pass


func _on_tile_lighter_darken_player():
	switch_on.play()
	turn_off_lights.emit(false)
	spot_light_3d.visible = false
	pass 
