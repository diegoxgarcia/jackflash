class_name AttackEnemy
extends State

@onready var animation_player: AnimationPlayer = $"../../visual/Enemy/AnimationPlayer"
@onready var enemy_rasta: EnemyRasta = $"../.."
@onready var enemy_attacker_shape_3d: CollisionShape3D = $"../../visual/Components/EnemyAttacker/CollisionShape3D"

var player: Player
func physics_update(delta : float):
	var direction = player.global_position-enemy_rasta.global_position
	enemy_rasta.velocity = direction.normalized() * 5 #enemy_rasta.speed
	pass

func update(delta : float):
	
	pass


func enter():
	
	match is_type_enemy(animation_player):
		"EnemyRasta":
			animation_player.play("Attack")
		"EnemyMichelle":
			animation_player.play("Attack_punch")
	
	
	player = get_tree().get_first_node_in_group("Player")
	
	await get_tree().create_timer(0.7).timeout
	enemy_attacker_shape_3d.disabled = true
	await get_tree().create_timer(0.5).timeout
	enemy_attacker_shape_3d.disabled = false
	pass
	
func exit():
	animation_player.stop()
	pass
	
func is_type_enemy(animation_player:AnimationPlayer) -> String:
	
	return animation_player.get_parent().get_parent().get_parent().name
	pass
	
	
#script para el attacker
#animation_player.play("Attack")
   # await get_tree().create_timer(0.7).timeout
   # attacker_collision_shape_3d.disabled = false
	#await get_tree().create_timer(0.5).timeout
	#attacker_collision_shape_3d.disabled = true
