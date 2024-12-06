class_name Dead
extends State

@onready var player = $"../.."
@onready var animation_player = $"../../Visual/jackflash/AnimationPlayer"
@onready var dead = $"../../SFX/Dead"
@onready var blood = $"../../Visual/Components/Blood"

func enter():
	dead.play()
	blood.emitting  = true
	animation_player.play("Dead")
	pass

func exit():
	animation_player.stop()
	pass
