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
	
func change_name(label: Label, box: BoxContainer):
	var line_edit = LineEdit.new()
	box.add_child(line_edit)
	pass

func remove_team(team : Team):
	Global.teams_positions.pop_back()
	team._exit_tree()
	position_buttons()

func _on_add_team_pressed():
	Global.teams.push_back(Team.new())
	print(Global.teams_amount)
	get_node("Teams/TeamPanel" + str(Global.teams_amount) + "/Delete").connect("pressed", remove_team.bind(Global.teams[Global.teams_amount - 1]))
	get_node("Teams/TeamPanel" + str(Global.teams_amount) + "/Label").text = Global.teams[Global.teams_amount - 1].team_name
	get_node("Teams/TeamPanel" + str(Global.teams_amount)).show()
	Global.teams_positions.push_back(Global.teams_positions_examples[Global.teams_amount-1])
	position_buttons()
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
		6:
			get_node("AddTeam").hide()
