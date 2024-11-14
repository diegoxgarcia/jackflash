class_name InteractiveTile
extends StaticBody3D

signal color_changed

@onready var mesh_instance_3d = $MeshInstance3D
@export var interactive_tile_data : InteractiveTileData
var current_color : int
var tile_colors_size : int
var key_color : int

func _ready():
	pass
	
func change_color_on_stomp():
	current_color += 1
	if current_color < interactive_tile_data.tile_color.size():
		change_color(current_color)
	else:
		current_color = 0
		change_color(current_color)
	color_changed.emit(current_color)
	pass

func change_color(index_color : int):
	mesh_instance_3d.get_active_material(0).albedo_color = interactive_tile_data.tile_color[index_color]
	pass
