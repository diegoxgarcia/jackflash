class_name DeadEnemy
extends State

@onready var animation_player: AnimationPlayer = $"../../visual/Enemy/AnimationPlayer"
@onready var enemy_rasta: EnemyRasta = $"../.."

func enter():
	animation_player.play("Dead")
	enemy_rasta.set_physics_process(false)
	pass

func exit():
	animation_player.stop()
	pass
