class_name DeadEnemy
extends State

@onready var animation_player: AnimationPlayer = $"../../Visual/Enemy/AnimationPlayer"
@onready var enemy_rasta: EnemyRasta = $"../.."
@onready var dead = $"../../SFX/Dead"

func enter():
	dead.play()
	animation_player.play("Dead")
	enemy_rasta.set_physics_process(false)
	pass

func exit():
	animation_player.stop()
	pass
