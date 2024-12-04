class_name take_damage_enemy
extends State
@onready var animation_player: AnimationPlayer = $"../../visual/Enemy/AnimationPlayer"
@onready var enemy_rasta: EnemyRasta = $"../.."
@onready var rasta: Node3D = $"../../visual/Enemy"
@onready var components: Node3D = $"../../visual/Components"
func enter():
	animation_player.play("TakeDamage")
	
	pass
func physics_update(delta : float):
	
	pass

func update(delta : float):
	
	pass


func exit():
	animation_player.stop()
	pass
