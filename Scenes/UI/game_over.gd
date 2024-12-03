extends Area3D

@onready var animation_player = $AnimationPlayer
@onready var game_over_particle = $GameOverParticle

func init_animation():
	animation_player.play("zoom_and_flick")
	pass

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "zoom_and_flick":
		animation_player.play("flip_and_flick")
		game_over_particle.emitting = true
	pass
