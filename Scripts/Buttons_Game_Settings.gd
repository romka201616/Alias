extends Node2D

var time : int
var score : int
var difficulty : String

# Called when the node enters the scene tree for the first time.
func _ready():
	time = 30
	score = 30
	difficulty = "Easy"

func _on_back_pressed():
	Global.round = null
	var next_scene = load("res://Scenes/team_settings.tscn")
	get_tree().change_scene_to_packed(next_scene)

func _on_ok_pressed():
	Global.round = Round.new(time, score, difficulty, Global.teams[0])
	var next_scene = load("res://Scenes/next_team.tscn")
	get_tree().change_scene_to_packed(next_scene)

func _on_time_30_pressed():
	time = 30
	get_node("Time/Time30").disabled = true
	get_node("Time/Time60").disabled = false
	get_node("Time/Time90").disabled = false

func _on_time_60_pressed():
	time = 60
	get_node("Time/Time30").disabled = false
	get_node("Time/Time60").disabled = true
	get_node("Time/Time90").disabled = false

func _on_time_90_pressed():
	time = 90
	get_node("Time/Time30").disabled = false
	get_node("Time/Time60").disabled = false
	get_node("Time/Time90").disabled = true
	
func _on_score_30_pressed():
	score = 30
	get_node("Score/Score30").disabled = true
	get_node("Score/Score50").disabled = false
	get_node("Score/Score70").disabled = false

func _on_score_50_pressed():
	score = 50
	get_node("Score/Score30").disabled = false
	get_node("Score/Score50").disabled = true
	get_node("Score/Score70").disabled = false

func _on_score_70_pressed():
	score = 70
	get_node("Score/Score30").disabled = false
	get_node("Score/Score50").disabled = false
	get_node("Score/Score70").disabled = true

func _on_low_pressed():
	difficulty = "Easy"
	get_node("Difficulty/Low").disabled = true
	get_node("Difficulty/Medium").disabled = false
	get_node("Difficulty/Hard").disabled = false
	
func _on_medium_pressed():
	difficulty = "Medium"
	get_node("Difficulty/Low").disabled = false
	get_node("Difficulty/Medium").disabled = true
	get_node("Difficulty/Hard").disabled = false
	
func _on_hard_pressed():
	difficulty = "Hard"
	get_node("Difficulty/Low").disabled = false
	get_node("Difficulty/Medium").disabled = false
	get_node("Difficulty/Hard").disabled = true
