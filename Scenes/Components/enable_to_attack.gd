extends Area3D

signal enable_to_attack

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		enable_to_attack.emit()
	pass
