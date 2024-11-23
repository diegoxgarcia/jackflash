extends Area3D

func _on_body_entered(body : InteractiveTile):
	if body.is_in_group("InteractiveTile"):
		body.change_color_on_stomp()
	pass
