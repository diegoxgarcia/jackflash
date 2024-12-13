class_name Stomp
extends State

@onready var player = $"../.."
@onready var animation_player = $"../../Visual/jackflash/AnimationPlayer"
@onready var jackflash = $"../../Visual/jackflash"
@onready var stomper_collision_shape_3d = $"../../Visual/Components/Stomper/CollisionShape3D"
@onready var fall = $"../../SFX/Fall"

func physics_update(delta : float):
	if not player.is_on_floor():
		player.velocity += player.get_gravity() * delta * 10
	else:
		fall.play()
		transitioned.emit(self, "Idle")
	pass
	
func enter():
	animation_player.play("Fall")
	stomper_collision_shape_3d.disabled = false
	pass

func exit():
	animation_player.stop()
	Input.start_joy_vibration(0, 0.8, 0.8, 0.2)
	stomper_collision_shape_3d.disabled = true
	pass
