class_name Walk_enemy
extends State
@onready var enemy_rasta: CharacterBody3D = $"../.."
@onready var animation_player: AnimationPlayer = $"../../visual/rasta/AnimationPlayer"

func enter():
	animation_player.play("Walk")
	pass
func exit():
	animation_player.stop()
	pass
