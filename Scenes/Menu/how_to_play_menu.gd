class_name HowToPlayMenu
extends Control

var vbox_aux : VBoxContainer

func show_and_hide(vbox : VBoxContainer):
	vbox_aux = vbox
	vbox.hide()
	show()
	pass

func _on_back_button_pressed():
	self.hide()
	vbox_aux.show()
	pass 
