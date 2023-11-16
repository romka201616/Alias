extends Node2D

var draggable = false
var is_inside_dropable = false
var is_inside_accept = false
var offset: Vector2
var default_pos  = Vector2(540, 1456)
var word_manager = preload("res://Resources/Words.gd").new()
var seconds : int

func _process(_delta):
	seconds = round(get_parent().get_node("Timer").time_left)
	if seconds % 60 > 9:
		get_parent().get_node("UI/TimeShow").text = "0" + str(seconds / 60) + ":" + str(seconds%60)
	else:
		get_parent().get_node("UI/TimeShow").text = "0" + str(seconds / 60) + ":" + "0" + str(seconds%60)
	if draggable:
		if Input.is_action_just_pressed("click"):
			offset = get_global_mouse_position() - global_position
			Global.is_dragging = true
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position() - offset
		elif Input.is_action_just_released("click"):
			if is_inside_dropable:
				Global.words.append(Word.new(get_node("Word").text, is_inside_accept))
				if is_inside_accept:
					get_parent().tmp_score += 1
					get_parent().get_node("UI/Score").text = str(get_parent().tmp_score)
				get_node("Word").text = word_manager.get_word(Global.round.difficulty)
			Global.is_dragging = false
			global_position = default_pos

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.words = []
	if Global.game_ready_count == 1:
		word_manager = load("res://Resources/Words.gd").new()
		word_manager.load_words()
		get_node("Word").text = word_manager.get_word(Global.round.difficulty)
		get_parent().get_node("Timer").wait_time = Global.round.time
		get_parent().get_node("Timer").start()

func _on_area_2d_mouse_entered():
	if not Global.is_dragging and not get_parent().get_node("Timer").paused:
		draggable = true
		scale = Vector2(1.05, 1.05)

func _on_area_2d_mouse_exited():
	if not Global.is_dragging:
		draggable = false
		scale = Vector2(1,1)


func _on_area_2d_body_entered(body:StaticBody2D):
	if body.is_in_group('dropable'):
		is_inside_dropable = true
		if body.is_in_group("accept"):
			is_inside_accept = true
		else:
			pass


func _on_area_2d_body_exited(body):
	if body.is_in_group('dropable'):
		is_inside_dropable = false
		if body.is_in_group("accept"):
			is_inside_accept = false
			


func _on_timer_timeout():
	Global.round.current_team = Global.teams[0]
	Global.round.current_team.score = get_parent().tmp_score
	var next_scene = load("res://Scenes/score_settings.tscn")
	get_tree().change_scene_to_packed(next_scene)
	
