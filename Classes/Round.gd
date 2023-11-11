extends Control

class_name Round

var time : int
var score: int
var difficulty: String
var current_team : Team

func _init(new_time, new_score, new_difficulty, new_current_team):
	time = new_time
	score = new_score
	difficulty = new_difficulty
	current_team = new_current_team
