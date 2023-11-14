extends Node2D

var tmp_score : int

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.game_ready_count == 0:
		Global.game_ready_count = 1
	else:
		tmp_score = 0
		get_node("UI/Score").text = str(tmp_score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_pause_pressed():
	get_node("Pause").visible = true
	get_node("Timer").paused = true


func _on_unpause_pressed():
	get_node("Pause").visible = false
	get_node("Timer").paused = false
