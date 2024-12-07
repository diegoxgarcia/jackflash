class_name Drop
extends State

@onready var player = $"../.."
@onready var taker_marker = $"../../Visual/Components/Collecter/TakerMarker"
@onready var drop = $"../../SFX/Drop"

func update(delta : float):
	transitioned.emit(self, "idle")
	pass

func enter():
	drop.play()
	var musical_score : MusicalScore = taker_marker.get_child(0)
	musical_score.reparent(player.get_parent_node_3d(), false)
	musical_score.global_position = player.global_position
	pass

func exit():
	pass
