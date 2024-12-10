class_name EnemyRasta
extends CharacterBody3D

@onready var state_machine: StateMachine = $StateMachine
@onready var enemy_ataquer_shape: CollisionShape3D = $Visual/Components/EnemyAttacker/CollisionShape3D
@onready var take_damage_enemy = $Visual/Components/TakeDamageEnemy
@onready var player_detector = $Visual/Components/PlayerDetector
@onready var enemy_attacker = $Visual/Components/EnemyAttacker
@onready var enable_to_attack = $Visual/Components/EnableToAttack
@onready var enemy_dead_particle = $Visual/Components/EnemyDeadParticle
@onready var animation_player = $Visual/Enemy/AnimationPlayer

signal boss_dead

var player : Player
var speed: float = 2.0

func _physics_process(delta):
	move_and_slide()
pass

func _on_take_damage_enemy_enemy_take_damage(area) -> void:
	state_machine.current_state.transitioned.emit(state_machine.current_state, "dead")	
	take_damage_enemy.disconnect("enemy_take_damage", _on_take_damage_enemy_enemy_take_damage)
	player_detector.disconnect("player_detected", _on_player_detector_player_detected)
	player_detector.disconnect("player_undetected", _on_player_detector_player_undetected)
	enable_to_attack.disconnect("enable_to_attack", _on_enable_to_attack_enable_to_attack)
	pass

func _on_player_detector_player_detected(body) -> void:
	if body.is_in_group("Player"):
		state_machine.current_state.transitioned.emit(state_machine.current_state, "chase")
	pass 

func _on_player_detector_player_undetected(body) -> void:
	if body.is_in_group("Player"):
		state_machine.current_state.transitioned.emit(state_machine.current_state, "Idle")
	pass 

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	match anim_name:
		"Attack","TakeDamage","Punch","Attack_punch":
			state_machine.current_state.transitioned.emit(state_machine.current_state, "chase")
		"Dead":
			enemy_dead_particle.emitting = true
	pass

func _on_enable_to_attack_enable_to_attack() -> void:
	state_machine.current_state.transitioned.emit(state_machine.current_state, "attack")
	pass


func _on_enemy_dead_particle_finished():
	if animation_player.get_parent().get_parent().get_parent().name == "EnemyBoss":
		boss_dead.emit()
	queue_free()
	pass
