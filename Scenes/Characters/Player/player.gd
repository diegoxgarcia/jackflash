class_name Player
extends CharacterBody3D

const SPEED = 5.0
const RUN_SPEED = 8.0
const JUMP_VELOCITY = 5.5
@onready var state_machine = $StateMachine

func _physics_process(delta):
	## Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
		#animation_player.play("Fall")

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
		#animation_player.play("JumpAndStay")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	#var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	#if direction:
		#velocity.x = direction.x * SPEED
		#velocity.z = direction.z * SPEED
		#animation_player.play("Walk")
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
		#velocity.z = move_toward(velocity.z, 0, SPEED)
		#animation_player.play("Idle")
		#
	#if direction:
		#jackflash.rotation.y = atan2(direction.x, direction.z)

	move_and_slide()


func _on_animation_player_animation_finished(anim_name):
	match anim_name:
		"Attack":
			state_machine.current_state.transitioned.emit(state_machine.current_state, "Idle")
	pass
