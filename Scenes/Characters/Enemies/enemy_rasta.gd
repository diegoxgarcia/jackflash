extends CharacterBody3D
# Variables para el enemigo
var speed: float = 5.0
var attack_range: float = 2.0
var attack_timer: float = 0.0
var attack_cooldown: float = 1.0
#instancia

func _on_player_detection_area_body_entered(body: Node3D) -> void:
	print("Player detectado")
	pass # Replace with function body.


func _on_player_detection_area_body_exited(body: Node3D) -> void:
	print("Player sale del area de pesecucion")
	pass # Replace with function body.


func _on_hit_area_area_entered(area: Area3D) -> void:
	print("disparo conecta con el enemigo")
	pass # Replace with function body.
