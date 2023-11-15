extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.game_ready_count == 1:
		var node = preload("res://Scenes/word_panel.tscn")
		for i in range(Global.words.size()):
			var cloned_node = node.instantiate()
			var label = cloned_node.get_node("Word")
			label.text = Global.words[i].text
			add_child(cloned_node)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
