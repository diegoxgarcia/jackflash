class_name Attack
extends State

@onready var animation_player = $"../../Visual/jackflash/AnimationPlayer"
@onready var player = $"../.."
@onready var attacker_collision_shape_3d = $"../../Visual/Components/Attacker/CollisionShape3D"
@onready var elvis_lightning = $"../../Visual/Components/ElvisLightning"
@onready var attack = $"../../SFX/Attack"

func physics_update(delta : float):
	var direction = get_direction(player)
	if direction:
		go_idle(player)
	pass
	
func update(delta : float):
	var direction = get_direction(player)
	if direction:
		transitioned.emit(self, "walk")
	if Input.is_action_just_pressed("jump"):
		transitioned.emit(self, "jump")
	pass

func enter():
	animation_player.play("Attack")
	await get_tree().create_timer(0.7).timeout
	attack.play()
	elvis_lightning.lightning_on()
	attacker_collision_shape_3d.disabled = false
	await get_tree().create_timer(0.5).timeout
	elvis_lightning.lightning_off()
	attacker_collision_shape_3d.disabled = true
	pass

func exit():
	animation_player.stop()
	pass
