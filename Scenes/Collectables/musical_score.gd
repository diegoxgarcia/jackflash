class_name MusicalScore
extends Area3D

@onready var animation_player = $AnimationPlayer
@onready var music_score_particles = $MusicScoreParticles

var tile_color : Color

func _ready():
	music_score_particles.emitting = true 

func stop_idle():
	animation_player.play("taked")
	music_score_particles.emitting = false
	pass	
	
func play_idle():
	animation_player.play("idle")
	pass
