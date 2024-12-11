class_name Take
extends State

@onready var player = $"../.."
@onready var taker_marker = $"../../Visual/Components/Collecter/TakerMarker"
@onready var take = $"../../SFX/Take"

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
		Input.start_joy_vibration(0, 0.3, 0.3, 0.3)
		take.play()
	pass

func exit():
	pass
