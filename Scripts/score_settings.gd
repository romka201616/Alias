extends Node2D

func _on_ok_pressed():
	if Global.round.current_team.score >= Global.round.score:
		var next_scene = load("res://Scenes/final_screen.tscn")
		get_tree().change_scene_to_packed(next_scene)
	else:
		var first_team = Global.teams[0]
		for i in Global.teams:
			print(i.team_name)
		
		for i in range(1, Global.teams_amount):
			Global.teams[i-1] = Global.teams[i]
		
		Global.teams[Global.teams_amount-1] = first_team	
		
		for i in Global.teams:
			print(i.team_name)
		
		var next_scene = load("res://Scenes/next_team.tscn")
		get_tree().change_scene_to_packed(next_scene)
