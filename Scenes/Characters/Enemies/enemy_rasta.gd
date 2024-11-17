class_name EnemyRasta
extends CharacterBody3D

# Variables para el enemigo
var speed: float = 5.0
var attack_range: float = 2.0
var attack_timer: float = 0.0
var attack_cooldown: float = 1.0
#instancia
func _on_take_damage_enemy_enemy_take_damage() -> void:
	#bajar vida al rasta
	pass # Replace with function body.


func _on_player_detector_player_detected() -> void:
	#cundo detecta al player lo corre
	pass # Replace with function body.
