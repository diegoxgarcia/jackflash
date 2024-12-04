class_name Dance
extends State

@onready var animation_player = $"../../Visual/jackflash/AnimationPlayer"

func enter():
	animation_player.play("Dance")
	pass

func exit():
	animation_player.stop()
	pass
