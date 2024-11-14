class_name Player
extends CharacterBody3D

const SPEED = 5.0
const RUN_SPEED = 8.0
const JUMP_VELOCITY = 5.5
@onready var state_machine = $StateMachine

func _physics_process(delta):
	move_and_slide()


func _on_animation_player_animation_finished(anim_name):
	match anim_name:
		"Attack":
			state_machine.current_state.transitioned.emit(state_machine.current_state, "Idle")
	pass
