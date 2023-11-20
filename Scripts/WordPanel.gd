extends VBoxContainer

var score_label : Label

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.teams.size() >= 2 and Global.round != null:
		score_label = get_parent().get_parent().get_parent().get_node("UI/Score")
		Global.round.current_team = Global.teams[0]
		score_label.text = "Счёт: " + str(Global.round.current_team.score)
		var node = preload("res://Scenes/word_panel.tscn")
		for i in range(Global.words.size()):
			var cloned_node = node.instantiate()
			var label = cloned_node.get_node("Word")
			label.text = Global.words[i].text
			var yes_button = cloned_node.get_node("Yes")
			var no_button = cloned_node.get_node("No")
			yes_button.connect("pressed", yes_pressed.bind(yes_button, no_button))
			no_button.connect("pressed", no_pressed.bind(yes_button, no_button))
			yes_button.disabled = Global.words[i].accepted
			no_button.disabled = not Global.words[i].accepted 
			add_child(cloned_node)

func yes_pressed(yes_button: Button, no_button: Button):
	yes_button.disabled = true
	no_button.disabled = false
	Global.round.current_team.score += 1
	score_label.text = "Счёт: " + str(Global.round.current_team.score)

func no_pressed(yes_button: Button, no_button: Button):
	yes_button.disabled = false
	no_button.disabled = true
	Global.round.current_team.score -= 1
	score_label.text = "Счёт: " + str(Global.round.current_team.score)
