class_name Idle_enemy
extends State
@onready var enemy_rasta: CharacterBody3D = $"../.."
@onready var animation_player: AnimationPlayer = $"../../visual/rasta/AnimationPlayer"

#sobreescribir las funciones "enter","exit", "update"
func enter():
	go_idle_enemy(enemy_rasta)
	animation_player.play("Idle")
	pass
func exit():
	animation_player.stop()
	pass
	
