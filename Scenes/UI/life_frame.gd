extends Panel

@onready var animation_player = $AnimationPlayer

func lost_life_1():
	animation_player.play("broken_heart")
	pass
	
func lost_life_2():
	animation_player.play("broken_heart_2")
	pass
	
func lost_life_3():
	animation_player.play("broken_heart_3")
	pass
