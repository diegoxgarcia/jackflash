class_name Run
extends State

@onready var player = $"../.."
@onready var jackflash = $"../../Visual/jackflash"
@onready var animation_player = $"../../Visual/jackflash/AnimationPlayer"
@onready var components = $"../../Visual/Components"

func physics_update(delta : float):
	var direction = get_direction(player)
	if Input.is_action_just_pressed("jump"):
		transitioned.emit(self, "jump")
	if Input.is_action_just_released("run"):
		transitioned.emit(self, "walk") 
	if direction:
		go_to(player, direction, player.RUN_SPEED)
		change_direction_velocity(jackflash, components, direction)
	else: 
		transitioned.emit(self, "idle")
	if not player.is_on_floor():
		transitioned.emit(self, "fall")
	pass

func enter():
	if player.is_on_floor():
		animation_player.play("Run")
	pass

func exit():
	animation_player.stop()
	pass
