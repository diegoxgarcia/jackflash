class_name Walk_enemy
extends State
@onready var enemy_rasta: CharacterBody3D = $"../.."
@onready var animation_player: AnimationPlayer = $"../../visual/rasta/AnimationPlayer"
var direccion: Vector3
var patrullar:float
func enter():
	#patrullarRandom()
	animation_player.play("Walk")
	pass
func exit():
	animation_player.stop()
	pass
	
func patrullarRandom():
	direccion= Vector3(randf_range(-1,1),0,randf_range(-1,1)).normalized()
	patrullar=randf_range(1,3)
pass
