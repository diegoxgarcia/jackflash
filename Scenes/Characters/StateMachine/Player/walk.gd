class_name Walk
extends State

@onready var player = $"../.."
@onready var animation_player = $"../../Visual/jackflash/AnimationPlayer"
@onready var jackflash = $"../../Visual/jackflash"
@onready var components = $"../../Visual/Components"

func physics_update(delta : float):
	var direction = get_direction(player)
	if direction:
		go_to(player, direction, player.SPEED)
		change_direction_velocity(jackflash, components, direction)
	else:
		transitioned.emit(self, "idle")
	if not player.is_on_floor():
		transitioned.emit(self, "fall")
	pass
	
func update(delta : float):
	if Input.is_action_just_pressed("jump"):
		transitioned.emit(self, "jump")
	if Input.is_action_just_pressed("attack"):
		transitioned.emit(self, "attack")
	if Input.is_action_just_pressed("run"):
		transitioned.emit(self, "run")		
	pass

func enter():
	if player.is_on_floor():
		animation_player.play("Walk")
	pass

func exit():
	animation_player.stop()
	pass
