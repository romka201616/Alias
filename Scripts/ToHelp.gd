extends Button


func _on_pressed():
	var next_scene = load("res://Scenes/help.tscn")
	get_tree().change_scene_to_packed(next_scene)
