extends Area3D
signal player_detected


func _on_body_entered(body: Node3D) -> void:
	
	player_detected.emit(body)
	pass # Replace with function body.
