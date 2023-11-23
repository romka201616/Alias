extends Node2D

var draggable = false
var is_inside_dropable = false
var screen : int
var offset: Vector2
var default_pos  = Vector2(540, 1456)

func _process(_delta):
	pass

func _ready():
	screen = 1
	
func _on_next_help_pressed():
	if screen == 13:
		var next_scene = load("res://Scenes/menu.tscn")
		get_tree().change_scene_to_packed(next_scene)
	else:
		get_node("Help" + str(screen)).hide()
		get_node("Help" + str(screen+1)).show()
		screen+=1
