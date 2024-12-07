extends Area3D

signal player_detected
signal player_undetected

func _on_body_entered(body: Node3D) -> void:
	
	player_detected.emit(body)
	pass # Replace with function body.


func _on_body_exited(body: Node3D) -> void:
	player_undetected.emit(body)
	pass # Replace with function body.
