extends Node2D

func _on_back_pressed():
	var next_scene = load("res://Scenes/game_settings.tscn")
	get_tree().change_scene_to_packed(next_scene)

func _on_ok_pressed():
	var next_scene = load("res://Scenes/game.tscn")
	get_tree().change_scene_to_packed(next_scene)
