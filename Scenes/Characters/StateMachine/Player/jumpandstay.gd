class_name JumpAndStay
extends State

@onready var player = $"../.."
@onready var animation_player = $"../../Visual/jackflash/AnimationPlayer"
@onready var jackflash = $"../../Visual/jackflash"

func physics_update(delta : float):
	var direction = get_direction(player)
	if not player.is_on_floor():
		player.velocity += player.get_gravity() * delta
		if direction:
			go_to(player, direction, player.SPEED)
			change_direction_velocity(jackflash, direction)
	else:
		transitioned.emit(self, "idle")
	pass
	
func enter():
	player.velocity.y = player.JUMP_VELOCITY
	animation_player.play("JumpAndStay")
	pass

func exit():
	animation_player.stop()
	pass
