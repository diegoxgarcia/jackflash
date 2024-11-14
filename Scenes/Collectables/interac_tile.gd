class_name InteracTile
extends Node3D

var rng = RandomNumberGenerator.new()
var interactive_tile_data = InteractiveTileData.new()

var key_color = rng.randi_range(0, interactive_tile_data.tile_color.size() - 1)

func _ready():
	print_debug(str(key_color))

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
		print_debug("Are Equals")
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
