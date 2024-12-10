class_name AttackEnemy
extends State

@onready var animation_player: AnimationPlayer = $"../../Visual/Enemy/AnimationPlayer"
@onready var enemy_rasta: EnemyRasta = $"../.."
@onready var enemy_attacker_shape_3d: CollisionShape3D = $"../../Visual/Components/EnemyAttacker/CollisionShape3D"
@onready var attack = $"../../SFX/Attack"

var player: Player

func physics_update(delta : float):
	var direction = player.global_position - enemy_rasta.global_position
	enemy_rasta.velocity = direction.normalized()
	pass

func enter():
	player = get_tree().get_first_node_in_group("Player")
	match is_type_enemy(animation_player):
		"EnemyRasta":
			animation_player.play("Attack")
			await get_tree().create_timer(0.7).timeout
			enemy_attacker_shape_3d.disabled = false
			attack.play()
			await get_tree().create_timer(0.5).timeout
			enemy_attacker_shape_3d.disabled = true
		"EnemyMichelle":
			animation_player.play("Attack_punch")
			await get_tree().create_timer(1.2).timeout
			enemy_attacker_shape_3d.disabled = false

			await get_tree().create_timer(0.6).timeout
			enemy_attacker_shape_3d.disabled = true
		"EnemyBoss":
			animation_player.play("Punch")
			await get_tree().create_timer(1.2).timeout
			enemy_attacker_shape_3d.disabled = false
			attack.play()
			await get_tree().create_timer(0.8).timeout
			enemy_attacker_shape_3d.disabled = true
	pass
	
func exit():
	animation_player.stop()
	pass
