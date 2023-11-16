extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.score_ready_count == 1:
		var score_show = get_parent().get_parent().get_parent().get_node("UI/Score")
		Global.round.current_team = Global.teams[0]
		score_show.text = "Счёт: " + str(Global.round.current_team.score)
		var node = preload("res://Scenes/word_panel.tscn")
		for i in range(Global.words.size()):
			var cloned_node = node.instantiate()
			var label = cloned_node.get_node("Word")
			label.text = Global.words[i].text
			add_child(cloned_node)
	else:
		Global.score_ready_count = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
