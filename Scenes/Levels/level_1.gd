class_name Level1
extends Node3D

@onready var directional_light_3d = $DirectionalLight3D

func _on_interac_tile_turn_off_lights(on):
	directional_light_3d.visible = !on
	pass
