class_name Dead
extends State

@onready var player = $"../.."
@onready var animation_player = $"../../Visual/jackflash/AnimationPlayer"

func enter():
	animation_player.play("Dead")
	pass

func exit():
	animation_player.stop()
	pass
