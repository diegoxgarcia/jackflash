class_name fall_idle_enemy
extends State

@onready var enemy_rasta = $"../.."
@onready var animation_player = $"../../Visual/Enemy/AnimationPlayer"

func physics_update(delta : float):
	if not enemy_rasta.is_on_floor():
		enemy_rasta.velocity += enemy_rasta.get_gravity() * delta
	else:
		transitioned.emit(self, "Idle")
	pass
	
func enter():
	match is_type_enemy(animation_player):
		"EnemyRasta":
			animation_player.play("FallIdle")
		"EnemyBoss":
			animation_player.play("Idle")
	pass

func exit():
	animation_player.stop()
	pass
