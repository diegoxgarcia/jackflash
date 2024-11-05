extends CharacterBody3D 
class_name Enemy

@export var SPEED:float = 5.0
@export var detection_range:float =10.0
@export var attack_damage:int = 10
@export var hp:int =100
@onready var player = get_tree().get_nodes_in_group("Player")[0]
@onready var dir=(player.global_position).normalized()

var vel:Vector3 =Vector3()





func _ready() -> void:
	
	pass
func _process(delta: float) -> void:
	
	pass
	

#detecta los ataque resividos por el player
func _on_hit_area_area_entered(area: Area3D) -> void:
	print("entrando al hit area del enemigo")
	pass # Replace with function body.

#detecta al jugador para cuando entra en el rango de ataque
func _on_attack_area_body_entered(body: Node3D) -> void:
	print("entrando al attack area del enemigo")
	
	pass # Replace with function body.

#detecta al jugador y lo persigue
func _on_detection_area_body_entered(body: Node3D) -> void:
	#ver no funciona
	print("iniciando persecucion")
	
	pass # Replace with function body.
