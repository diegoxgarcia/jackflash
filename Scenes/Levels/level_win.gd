extends Node3D

@onready var player = $Player
@onready var state_machine = $Player/StateMachine
@onready var animation_player = $AnimationPlayer

func _ready():
	state_machine.current_state.transitioned.emit(state_machine.current_state, "dance")
	animation_player.play("dance_floor")
	pass
