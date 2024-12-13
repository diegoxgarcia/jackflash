class_name State
extends Node

signal transitioned

func physics_update(delta : float):
	pass
	
func update(delta : float):
	pass
	
func enter():
	pass

func exit():
	pass
	
### Funciones del Player ###	
	
func change_direction_velocity(jackflash : Node3D, components: Node3D, direction : Vector3):
	jackflash.rotation.y = atan2(direction.x, direction.z)
	components.rotation.y = atan2(direction.x, direction.z)
	pass

func get_direction(player : Player) -> Vector3:
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var direction = (player.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	return direction
	pass

func go_idle(player : Player):
	player.velocity.x = move_toward(player.velocity.x, 0, player.SPEED)
	player.velocity.z = move_toward(player.velocity.z, 0, player.SPEED)
	pass
	
func go_to(player : Player, direction : Vector3, speed : float):
	player.velocity.x = direction.x * speed
	player.velocity.z = direction.z * speed
	pass

### Funciones del Enemy ###

func change_direction_enemy_velocity(enemy : Node3D,components:Node3D,direction : Vector3):
	enemy.rotation.y = atan2(direction.x, direction.z)
	components.rotation.y = atan2(direction.x, direction.z)

func is_type_enemy(animation_player:AnimationPlayer) -> String:
	var enemy_type = animation_player.get_parent().get_parent().get_parent().name.rstrip("0123456789")
	return enemy_type
	pass
