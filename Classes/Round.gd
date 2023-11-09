extends Control

class_name Round

var time : int
var score: int
var difficulty: String

func _init(new_time, new_score, new_difficulty:):
	time = new_time
	score = new_score
	difficulty = new_difficulty
