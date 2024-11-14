class_name Jump
extends State

@onready var player = $"../.."
@onready var jackflash = $"../../Visual/jackflash"
@onready var animation_player = $"../../Visual/jackflash/AnimationPlayer"
@onready var components = $"../../Visual/Components"

func physics_update(delta : float):
	var direction = get_direction(player)
	if not player.is_on_floor():
		player.velocity += player.get_gravity() * delta
		if direction:
			go_to(player, direction, player.SPEED)
			change_direction_velocity(jackflash, components, direction)
	else:
		transitioned.emit(self, "idle")
	pass
	
func update(delta : float):
	if Input.is_action_just_pressed("attack"):
		transitioned.emit(self, "stomp")
	pass
	
func enter():
	player.velocity.y = player.JUMP_VELOCITY
	animation_player.play("Jump")
	pass

func exit():
	animation_player.stop()
	pass
