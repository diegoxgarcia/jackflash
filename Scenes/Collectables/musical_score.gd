class_name MusicalScore
extends Area3D

@onready var animation_player = $AnimationPlayer

func stop_idle():
	animation_player.play("taked")
	pass	
	
func play_idle():
	animation_player.play("idle")
