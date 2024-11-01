class_name Fall
extends State

@onready var player = $"../.."
@onready var jackflash = $"../../Visual/jackflash"
@onready var animation_player = $"../../Visual/jackflash/AnimationPlayer"

func physics_update(delta : float):
	var direction = get_direction(player)
	if not player.is_on_floor():
		player.velocity += player.get_gravity() * delta
		if direction:
			go_to(player, direction, player.SPEED)
			change_direction_velocity(jackflash, direction)
	else:
		transitioned.emit(self, "Idle")
	pass
	
func enter():
	animation_player.play("Fall")
	pass

func exit():
	animation_player.stop()
	pass
