extends Node3D

@onready var directional_light_3d = $DirectionalLight3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_interac_tile_turn_off_lights(on):
	directional_light_3d.visible = !on
	pass
