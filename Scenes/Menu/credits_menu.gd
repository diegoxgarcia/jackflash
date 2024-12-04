class_name Credits
extends Control

var vbox_aux : VBoxContainer
@onready var animation_player = $AnimationPlayer

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel") && vbox_aux:
		self.hide()
		vbox_aux.show()
		animation_player.stop()
	
	if Input.is_action_pressed("jump"):
		animation_player.speed_scale = 10
	else:
		animation_player.speed_scale = 1
	pass


func show_hide_play(vbox : VBoxContainer):
	vbox_aux = vbox
	vbox.hide()
	show()
	animation_player.play("slide_up_credits")
	pass


func _on_animation_player_animation_finished(anim_name):
	match anim_name:
		"slide_up_credits":
			self.hide()
			vbox_aux.show()
	pass
