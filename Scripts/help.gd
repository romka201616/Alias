extends Node2D

var draggable = false
var is_inside_dropable = false

var offset: Vector2
var default_pos  = Vector2(540, 1456)

func _process(_delta):
	if draggable:
		if Input.is_action_just_pressed("click"):
			offset = get_global_mouse_position() - global_position
			Global.is_dragging = true
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position() - offset
			global_rotation_degrees = (global_position.x - 540) * 0.05
		elif Input.is_action_just_released("click"):
			if is_inside_dropable:
				Global.words.append(Word.new(get_node("Word").text, is_inside_accept))
				if is_inside_accept:
					get_parent().tmp_score += 1
					get_parent().get_node("UI/Score").text = str(get_parent().tmp_score)
				get_node("Word").text = word_manager.get_word(Global.round.difficulty)
			Global.is_dragging = false
			global_position = default_pos
			global_rotation_degrees = 0
