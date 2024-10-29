extends Control


func _ready():
	pass

func _on_test_enemy_pressed():
	get_tree().change_scene_to_file("res://Test/enemy_test.tscn")
	pass


func _on_test_player_pressed():
	get_tree().change_scene_to_file("res://Test/player_test.tscn")
	pass
