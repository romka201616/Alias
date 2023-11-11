extends Node2D

var time : int
var score : int
var difficulty : String

# Called when the node enters the scene tree for the first time.
func _ready():
	time = 60
	score = 50
	difficulty = "Medium"
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_back_pressed():
	var next_scene = load("res://Scenes/team_settings.tscn")
	get_tree().change_scene_to_packed(next_scene)

func _on_ok_pressed():
	Global.round = Round.new(time, score, difficulty, Global.teams[0])
	var next_scene = load("res://Scenes/next_team.tscn")
	get_tree().change_scene_to_packed(next_scene)

func _on_time_30_pressed():
	time = 30

func _on_time_60_pressed():
	time = 60


func _on_time_90_pressed():
	time = 90
	
func _on_score_30_pressed():
	score = 30

func _on_score_50_pressed():
	score = 50

func _on_score_70_pressed():
	score = 70

func _on_low_pressed():
	difficulty = "Easy"
	
func _on_medium_pressed():
	difficulty = "Medium"
	
func _on_hard_pressed():
	difficulty = "Hard"
