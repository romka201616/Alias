extends Node2D

var draggable = false
var is_inside_dropable = false
var is_inside_accept = false
var offset: Vector2
var default_pos  = Vector2(540, 1456)
var word_manager = preload("res://Resources/Words.gd").new()

func _process(_delta):
	if draggable:
		if Input.is_action_just_pressed("click"):
			offset = get_global_mouse_position() - global_position
			Global.is_dragging = true
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position() - offset
		elif Input.is_action_just_released("click"):
			if is_inside_dropable:
				get_node("Word").text = word_manager.get_word(Global.round.difficulty)
				if is_inside_accept:
					get_parent().tmp_score += 1
					get_parent().get_node("UI/Score").text = str(get_parent().tmp_score)
			Global.is_dragging = false
			global_position = default_pos

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.game_ready_count == 1:
		word_manager = load("res://Resources/Words.gd").new()
		word_manager.load_words()
		get_node("Word").text = word_manager.get_word(Global.round.difficulty)
		get_parent().get_node("Timer").wait_time = Global.round.time
		get_parent().get_node("Timer").start()

func _on_area_2d_mouse_entered():
	if not Global.is_dragging:
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
	get_parent().get_node("UI/TimeShow").text = get_parent().get_node("Timer").time_left
