class_name EnemyRasta
extends CharacterBody3D
var player : Player
@onready var visual: Node3D = $visual
@onready var state_machine: StateMachine = $StateMachine
@onready var enemy_ataquer_shape: CollisionShape3D = $visual/Components/EnemyAttacker/CollisionShape3D
@onready var take_damage_enemy = $visual/Components/TakeDamageEnemy
@onready var player_detector = $visual/Components/PlayerDetector
@onready var enemy_attacker = $visual/Components/EnemyAttacker
@onready var enable_to_attack = $visual/Components/EnableToAttack

var speed: float = 2.0
var attack_range: float = 2.0
var attack_timer: float = 0.0
var attack_cooldown: float = 1.0
var hp=3

func _physics_process(delta):
	move_and_slide()
pass

func _on_take_damage_enemy_enemy_take_damage(area) -> void:
	state_machine.current_state.transitioned.emit(state_machine.current_state, "dead")	
	take_damage_enemy.disconnect("enemy_take_damage", _on_take_damage_enemy_enemy_take_damage)
	player_detector.disconnect("player_detected", _on_player_detector_player_detected)
	player_detector.disconnect("player_undetected", _on_player_detector_player_undetected)
	enemy_attacker.disconnect("attacking", _on_enemy_attacker_attacking)
	
	pass # Replace with function body.

func _on_player_detector_player_detected(body) -> void:
	if body.is_in_group("Player"):
		print("area de deteccion activada")
		state_machine.current_state.transitioned.emit(state_machine.current_state, "chase")
	pass 

func _on_player_detector_player_undetected(body) -> void:
	if body.is_in_group("Player"):
		state_machine.current_state.transitioned.emit(state_machine.current_state, "Idle")
	pass 


func _on_enemy_attacker_attacking(body) -> void:
	print_debug("Player hit")
	#if body.is_in_group("Player"):
		#print("atacando")
		#state_machine.current_state.transitioned.emit(state_machine.current_state, "attack")
	pass

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	match anim_name:
		"Attack","TakeDamage","Punch","Attack_punch":
			state_machine.current_state.transitioned.emit(state_machine.current_state, "chase")
		"Dead":
			queue_free()
	pass

func _on_enable_to_attack_enable_to_attack() -> void:
	state_machine.current_state.transitioned.emit(state_machine.current_state, "attack")
	pass
