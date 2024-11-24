class_name IdleEnemy
extends State
@onready var animation_player: AnimationPlayer = $"../../visual/Rasta/AnimationPlayer"
@onready var enemy_rasta: EnemyRasta = $"../.."
@onready var rasta: Node3D = $"../../visual/Rasta"
@onready var components: Node3D = $"../../visual/Components"

var wander_time: float
var move_direction: Vector3

func randomize_wander():
	move_direction=Vector3(randf_range(-1,1),0,randf_range(-1,1)).normalized()
	wander_time=randf_range(1,2)
	pass

func physics_update(delta : float):
	if enemy_rasta:
		enemy_rasta.velocity = move_direction * enemy_rasta.speed
		change_direction_enemy_velocity(rasta,components,move_direction)
	pass

func update(delta : float):
	if wander_time > 0:
		wander_time -= delta
	else:
		randomize_wander()
	pass


func enter():
	randomize_wander()
	animation_player.play("Walk")
	
	pass

func exit():
	animation_player.stop()
	pass
	
func change_direction_enemy_velocity(enemy : Node3D,components:Node3D,direction : Vector3):
	enemy.rotation.y = atan2(direction.x, direction.z)
	components.rotation.y = atan2(direction.x, direction.z)
	


	
