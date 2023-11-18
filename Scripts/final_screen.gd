extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.final_ready_count == 0:
		Global.final_ready_count = 1
	else:
		get_node("UI/WinnerName").text = Global.round.current_team.team_name
		get_node("UI/WinnerScore").text = "Счёт: " + str(Global.teams[0].score)
		for i in range(2, 7):
			get_node("UI/TeamsContainer/Team" + str(i)).hide()
		
		Global.teams.sort_custom(custom_sort)
		
		for i in range(2, Global.teams_amount + 1):
			get_node("UI/TeamsContainer/Team" + str(i) + "/Name").text = Global.teams[i-1].team_name
			get_node("UI/TeamsContainer/Team" + str(i) + "/Score").text = str(Global.teams[i-1].score)
			get_node("UI/TeamsContainer/Team" + str(i)).show()

func custom_sort(a : Team, b : Team):
	if typeof(a.score) == typeof(b.score):
		return a.score > b.score;

func _on_new_game_pressed():
	var next_scene = load("res://Scenes/menu.tscn")
	get_tree().change_scene_to_packed(next_scene)
