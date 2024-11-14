class_name Attack
extends State

@onready var animation_player = $"../../Visual/jackflash/AnimationPlayer"
@onready var player = $"../.."
@onready var attacker_collision_shape_3d = $"../../Visual/Components/Attacker/CollisionShape3D"

func physics_update(delta : float):
	var direction = get_direction(player)
	if direction:
		go_idle(player)
	pass

func enter():
	animation_player.play("Attack")
	await get_tree().create_timer(0.7).timeout
	attacker_collision_shape_3d.disabled = false
	await get_tree().create_timer(0.5).timeout
	attacker_collision_shape_3d.disabled = true
	pass

func exit():
	animation_player.stop()
	pass
