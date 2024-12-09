class_name Dead
extends State

@onready var player = $"../.."
@onready var animation_player = $"../../Visual/jackflash/AnimationPlayer"
@onready var dead = $"../../SFX/Dead"
@onready var blood_particles = $"../../Visual/Components/BloodParticles"

func enter():
	dead.play()
	blood_particles.emitting  = true
	animation_player.play("Dead")
	pass

func exit():
	animation_player.stop()
	pass
