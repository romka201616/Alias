extends Node2D

func _ready():
	if Global.next_team_ready_count == 0:
		Global.next_team_ready_count = 1
	else:
		for i in range(1, 7):
			var team_panel = get_node("TeamShowContainer/Team" + str(i))
			team_panel.hide()
		for i in range(1, Global.teams_amount + 1):
			var team_panel = get_node("TeamShowContainer/Team" + str(i))
			team_panel.show()
			var name_label = get_node("TeamShowContainer/Team" + str(i) + "/Name")
			name_label.text = Global.teams[i-1].team_name
			var score_label = get_node("TeamShowContainer/Team" + str(i) + "/Score")
			score_label.text = str(Global.teams[i-1].score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

