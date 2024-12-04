class_name ChaseEnemy
extends State
@onready var animation_player: AnimationPlayer = $"../../visual/Enemy/AnimationPlayer"
@onready var enemy_rasta: EnemyRasta = $"../.."
@onready var rasta: Node3D = $"../../visual/Enemy"
@onready var components: Node3D = $"../../visual/Components"

var player: Player
func physics_update(delta : float):
	var direction = player.global_position-enemy_rasta.global_position
	enemy_rasta.velocity = direction.normalized() * 5 #enemy_rasta.speed
	change_direction_enemy_velocity(rasta,components,direction)
	pass

func update(delta : float):
	
	pass


func enter():
	player = get_tree().get_first_node_in_group("Player")
	match is_type_enemy(animation_player):
		"EnemyRasta":
			animation_player.play("Walk")
		"EnemyMichelle":
			animation_player.play("Run")
		"EnemyBoss":
			animation_player.play("Walk")
	
	pass
func exit():
	animation_player.stop()
	pass
	
func change_direction_enemy_velocity(enemy : Node3D, components:Node3D, direction : Vector3):
	enemy.rotation.y = atan2(direction.x, direction.z)
	components.rotation.y = atan2(direction.x, direction.z)	
func is_type_enemy(animation_player:AnimationPlayer) -> String:
	
	return animation_player.get_parent().get_parent().get_parent().name
	pass
func visual_rotation():
	#fijarse como rotar a michelle
	pass
