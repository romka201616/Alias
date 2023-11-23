extends Node2D

func _ready():
	if Global.next_team_ready_count == 0:
		Global.next_team_ready_count = 1
	elif Global.teams.size() >= 2 and Global.round != null:
		get_node("NextTurn").text = "Ход: " + Global.teams[0].team_name
		
		for i in range(1, 7):
			get_node("TeamShowContainer/Team" + str(i)).hide()
		for i in range(1, Global.teams_amount + 1):
			get_node("TeamShowContainer/Team" + str(i)).show()
			get_node("TeamShowContainer/Team" + str(i) + "/Name").text = Global.teams[i-1].team_name
			get_node("TeamShowContainer/Team" + str(i) + "/Score").text = str(Global.teams[i-1].score)
