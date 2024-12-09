class_name Fall
extends State

@onready var player = $"../.."
@onready var jackflash = $"../../Visual/jackflash"
@onready var animation_player = $"../../Visual/jackflash/AnimationPlayer"
@onready var components = $"../../Visual/Components"
@onready var fall = $"../../SFX/Fall"

func physics_update(delta : float):
	var direction = get_direction(player)
	if not player.is_on_floor():
		player.velocity += player.get_gravity() * delta
		if direction:
			go_to(player, direction, player.SPEED)
			change_direction_velocity(jackflash, components, direction)
	else:
		fall.play()
		transitioned.emit(self, "Idle")
		
	if player.global_position.y < -20:
		transitioned.emit(self, "dead")
	pass
	
func enter():
	animation_player.play("Fall")
	pass

func exit():
	animation_player.stop()
	pass
