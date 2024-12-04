extends Area3D
signal enable_to_attack

func _on_body_entered(body: Node3D) -> void:
	enable_to_attack.emit(body)
	pass # Replace with function body.
