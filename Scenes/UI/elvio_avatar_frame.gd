extends Panel

@onready var animation_player = $AnimationPlayer

func flicker_damage_elvio():
	animation_player.play("elvio_hurt")
pass
