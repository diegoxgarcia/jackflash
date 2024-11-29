extends Panel

@onready var animation_player = $AnimationPlayer

func flicker_score(color : Color):
	match color:
		Color.CYAN:
			animation_player.play("cyan_score")
		Color.YELLOW:
			animation_player.play("yellow_score")
		Color.TRANSPARENT:
			animation_player.play("transparent_score")
		Color.RED:
			animation_player.play("red_score")
		Color.GREEN:
			animation_player.play("green_score")
	pass
	
