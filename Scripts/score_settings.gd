extends Node2D

func _on_ok_pressed():
	if Global.round.current_team.score >= Global.round.score:
		var next_scene = load("res://Scenes/final_screen.tscn")
		get_tree().change_scene_to_packed(next_scene)
	else:
		pass
