extends Control

class_name Team

var team_name : String
var score: int

func _init(new_name: String = add_team(), new_score: int = 0):
	team_name = new_name
	score = new_score

func _exit_tree():
	Global.teams_amount -= 1
	print(Global.teams)

func add_team():
	Global.teams_amount += 1
	randomize() # Always call this function before using randi() or any other random function.
	var team = Global.teams_names[randi() % Global.teams_names.size()]
	Global.teams_names.erase(team)
	print(Global.teams_names)
	return team
