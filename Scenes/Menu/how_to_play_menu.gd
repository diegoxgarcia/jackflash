class_name HowToPlayMenu
extends Control

var vbox_aux : VBoxContainer
var label_aux : Label

func show_and_hide(vbox : VBoxContainer, recommends_label : Label):
	vbox_aux = vbox
	label_aux = recommends_label
	vbox.hide()
	recommends_label.hide()
	show()
	pass

func _on_back_button_pressed():
	self.hide()
	vbox_aux.show()
	label_aux.show()
	pass 
