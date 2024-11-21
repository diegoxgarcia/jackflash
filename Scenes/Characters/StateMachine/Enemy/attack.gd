class_name AttackEnemy
extends State

@onready var animation_player: AnimationPlayer = $"../../visual/Rasta/AnimationPlayer"
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
	player = get_tree().get_first_node_in_group("Player")
	animation_player.play("Attack")
	await get_tree().create_timer(0.7).timeout
	enemy_attacker_shape_3d.disabled = true
	await get_tree().create_timer(0.5).timeout
	enemy_attacker_shape_3d.disabled = false
	pass
func exit():
	animation_player.stop()
	pass
	
	
#script para el attacker
#animation_player.play("Attack")
   # await get_tree().create_timer(0.7).timeout
   # attacker_collision_shape_3d.disabled = false
	#await get_tree().create_timer(0.5).timeout
	#attacker_collision_shape_3d.disabled = true
