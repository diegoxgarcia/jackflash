class_name ChaseEnemy
extends State
@onready var animation_player: AnimationPlayer = $"../../visual/Rasta/AnimationPlayer"
@onready var enemy_rasta: EnemyRasta = $"../.."

var player: Player
func physics_update(delta : float):
	var direction = player.global_position-enemy_rasta.global_position
	enemy_rasta.velocity = direction.normalized() * 5 #enemy_rasta.speed
	pass

func update(delta : float):
	
	pass


func enter():
	player = get_tree().get_first_node_in_group("Player")
	animation_player.play("Walk")
	pass
func exit():
	animation_player.stop()
	pass
