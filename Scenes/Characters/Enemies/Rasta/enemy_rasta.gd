class_name EnemyRasta
extends CharacterBody3D
var player : Player
@onready var visual: Node3D = $visual
@onready var state_machine: StateMachine = $StateMachine
@onready var enemy_ataquer_shape: CollisionShape3D = $visual/Components/EnemyAttacker/CollisionShape3D



# Variables para el enemigo
var speed: float = 2.0
var attack_range: float = 2.0
var attack_timer: float = 0.0
var attack_cooldown: float = 1.0
var hp=3
#instancia

func _on_take_damage_enemy_enemy_take_damage(area) -> void:
	#bajar vida al rasta
	if area.is_in_group("Player"):
		
		state_machine.current_state.transitioned.emit(state_machine.current_state, "TakeDamage")
		
	pass # Replace with function body.


func _on_player_detector_player_detected(body) -> void:
	if body.is_in_group("Player"):
		print("area de deteccion activada")
		state_machine.current_state.transitioned.emit(state_machine.current_state, "chase")
	#cundo detecta al player lo corre
	#visual.look_at(player.global_position)
		
	pass # Replace with function body.
	
func _physics_process(delta):
	move_and_slide()
pass

func _on_player_detector_player_undetected(body) -> void:
	if body.is_in_group("Player"):
		
		state_machine.current_state.transitioned.emit(state_machine.current_state, "Idle")
	pass # Replace with function body.


func _on_enemy_attacker_attacking(body) -> void:
	if body.is_in_group("Player"):
		print("atacando")
		state_machine.current_state.transitioned.emit(state_machine.current_state, "attack")
	
	pass # Replace with function body.


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	match anim_name:
		"Attack","TakeDamage","Punch","Attack_punch":
			state_machine.current_state.transitioned.emit(state_machine.current_state, "chase")
		
	pass # Replace with function body.


func _on_enable_to_attack_enable_to_attack() -> void:
	enemy_ataquer_shape.disabled = false
	print("ataquer encendido")
	pass # Replace with function body.
