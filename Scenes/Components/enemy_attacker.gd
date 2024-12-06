extends Area3D

signal attacking

func _on_body_entered(body: Node3D) -> void:
	attacking.emit(body)
	pass
