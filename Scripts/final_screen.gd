extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.final_ready_count == 0:
		Global.final_ready_count = 1
	else:
		get_node("UI/WinnerName").text = Global.round.current_team.team_name
		get_node("UI/WinnerScore").text = "Счёт: " + str(Global.round.current_team.score)

