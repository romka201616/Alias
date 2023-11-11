extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_back_pressed():
	var next_scene = load("res://Scenes/game_settings.tscn")
	get_tree().change_scene_to_packed(next_scene)

func _on_ok_pressed():
	var next_scene = load("res://Scenes/game.tscn")
	get_tree().change_scene_to_packed(next_scene)
