class_name Idle
extends State

@onready var player = $"../.."
@onready var animation_player = $"../../Visual/jackflash/AnimationPlayer"

func update(delta : float):
	var direction = get_direction(player)
	if direction:
		transitioned.emit(self, "walk")
	if Input.is_action_just_pressed("jump") && player.is_on_floor():
		transitioned.emit(self, "jump")
	if Input.is_action_just_pressed("take") && player.is_on_floor() && !player.has_musical_score():
		transitioned.emit(self, "take")
	if Input.is_action_just_pressed("take") && player.is_on_floor() && player.has_musical_score():
		transitioned.emit(self, "drop")
	if not player.is_on_floor():
		transitioned.emit(self, "fall")
	if Input.is_action_just_pressed("attack") && !player.has_musical_score():
		transitioned.emit(self, "attack")
	pass
	
func enter():
	go_idle(player)
	animation_player.play("Idle")
	pass

func exit():
	animation_player.stop()
	pass
