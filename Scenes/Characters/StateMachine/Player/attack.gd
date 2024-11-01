class_name Attack
extends State

@onready var animation_player = $"../../Visual/jackflash/AnimationPlayer"
@onready var player = $"../.."

func physics_update(delta : float):
	var direction = get_direction(player)
	if direction:
		go_idle(player)
	pass

func enter():
	animation_player.play("Attack")
	pass

func exit():
	animation_player.stop()
	pass
