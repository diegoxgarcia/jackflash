class_name Take
extends State

@onready var player = $"../.."
@onready var taker_marker = $"../../Visual/Components/Collecter/TakerMarker"

func update(delta : float):
	transitioned.emit(self, "idle")
	pass

func enter():
	var musical_score : MusicalScore = player.get_musical_score()
	if musical_score:
		musical_score.stop_idle()
		player.info_action.text = ""
		musical_score.reparent(taker_marker, false)
		musical_score.global_position = taker_marker.global_position
	pass

func exit():
	pass
