class_name Player
extends CharacterBody3D

@export var player_data : PlayerData

const SPEED = 5.0
const RUN_SPEED = 8.0
const JUMP_VELOCITY = 5.5
@onready var state_machine = $StateMachine
@onready var info_action = $Visual/InfoAction
var musical_score : MusicalScore
@onready var taker_marker = $Visual/Components/Collecter/TakerMarker
var player_global_position : Vector3

signal update_life_data(life : int)

func _ready():
	player_global_position = global_position
	# Tomar la posicion global y cuando respawnea llevarlo a esa posicion|
	pass

func _physics_process(delta):
	move_and_slide()

func _on_animation_player_animation_finished(anim_name):
	match anim_name:
		"Jump":
			if not is_on_floor():
				state_machine.current_state.transitioned.emit(state_machine.current_state, "fall")
		"Attack":
			state_machine.current_state.transitioned.emit(state_machine.current_state, "Idle")
		"Dead":
			player_data.life = player_data.life - 1
			update_life_data.emit(player_data.life)
			if player_data.life > 0:
				global_position = player_global_position
				state_machine.current_state.transitioned.emit(state_machine.current_state, "Idle")
			else:
				pass
				#GameOver
	pass

func has_musical_score() -> bool:
	if taker_marker.get_child_count() > 0:
		return true
	else:
		return false
	pass
	
func get_musical_score() -> MusicalScore:
	return musical_score

func _on_collecter_player_collected(area : Area3D):
	if area.is_in_group("Collectable"):
		if area is MusicalScore:
			musical_score = area
			info_action.text = "Press E Key or B Button"
	pass

func _on_collecter_player_uncollected(area : Area3D):
	if area.is_in_group("Collectable"):
		if area is MusicalScore:
			musical_score = null
			info_action.text = ""
	pass
