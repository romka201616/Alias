extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func position_buttons():
	for i in range(1, 7):
		get_node("Teams/TeamPanel" + str(i)).hide()
		
	for i in range(1, Global.teams_amount+1):
		get_node("Teams/TeamPanel" + str(i) + "/Delete").connect("pressed", remove_team.bind(Global.teams[i - 1]))
		get_node("Teams/TeamPanel" + str(i) + "/Label").text = Global.teams[i-1].team_name
		get_node("Teams/TeamPanel" + str(i)).show()
		
	match Global.teams_amount:
		1:
			get_node("AddTeam").position = Vector2(545, 632)
		2:
			get_node("AddTeam").position = Vector2(42, 966)
		3:
			get_node("AddTeam").position = Vector2(545, 966)
		4:
			get_node("AddTeam").position = Vector2(42, 1303)
		5:
			get_node("AddTeam").position = Vector2(545, 1303)
			get_node("AddTeam").show()
		6:
			get_node("AddTeam").hide()
	
func change_name(team : Team, teamIndex: int, i: int):
	var line_edit = LineEdit.new()
	line_edit.text = team.team_name
	line_edit.rect_min_size =  get_node("Teams/TeamPanel" + str(Global.teams_amount) + "/Label").text
	line_edit.position =  get_node("Teams/TeamPanel" + str(Global.teams_amount) + "/Label").position
	get_node("Teams/TeamPanel" + str(i)).add_child(line_edit)

	position_buttons()

func remove_team(team : Team, teamIndex: int):
	Global.teams_names.push_back(team.team_name)
	Global.teams_positions.pop_back()
	Global.teams.remove_at(teamIndex)
	team._exit_tree()
	position_buttons()

func _on_add_team_pressed():
	Global.teams.push_back(Team.new())
	print(Global.teams_amount)
	get_node("Teams/TeamPanel" + str(Global.teams_amount) + "/Delete").connect("pressed", remove_team.bind(Global.teams[Global.teams_amount - 1], Global.teams_amount - 1))
	get_node("Teams/TeamPanel" + str(Global.teams_amount) + "/Edit").connect("pressed", change_name.bind(Global.teams[Global.teams_amount - 1], Global.teams_amount - 1), Global.teams_amount)
	get_node("Teams/TeamPanel" + str(Global.teams_amount) + "/Label").text = Global.teams[Global.teams_amount - 1].team_name
	get_node("Teams/TeamPanel" + str(Global.teams_amount)).show()
	Global.teams_positions.push_back(Global.teams_positions_examples[Global.teams_amount-1])
	position_buttons()


func _on_ok_pressed():
	var next_scene = load("res://Scenes/game_settings.tscn")
	get_tree().change_scene_to_packed(next_scene)
