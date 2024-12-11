class_name ChaseEnemy
extends State

@onready var animation_player: AnimationPlayer = $"../../Visual/Enemy/AnimationPlayer"
@onready var enemy_rasta: EnemyRasta = $"../.."
@onready var rasta: Node3D = $"../../Visual/Enemy"
@onready var components: Node3D = $"../../Visual/Components"
@onready var player_detected = $"../../SFX/PlayerDetected"

var player: Player

func physics_update(delta : float):
	var direction = player.global_position - enemy_rasta.global_position
	direction.y = 0
	enemy_rasta.velocity = direction.normalized() * 5
	change_direction_enemy_velocity(rasta,components,direction)
	pass

func update(delta : float):
	pass

func enter():
	player_detected.play()
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
