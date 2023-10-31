extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func get_team():
	randomize() # Always call this function before using randi() or any other random function.
	var random_team = Global.teams[randi() % Global.teams.size()]
	Global.teams.erase(random_team)
	print(Global.teams)
	return random_team
	
func change_name(label: Label, box: BoxContainer):
	var line_edit = LineEdit.new()
	box.add_child(line_edit)
	pass
	
func _on_pressed():
	var box = BoxContainer.new()
	add_child(box)

	var label = Label.new()
	label.text = get_team()
	box.add_child(label)

	var color_rect = ColorRect.new()
	color_rect.color = Color.ALICE_BLUE
	color_rect.set_size(Vector2(200, 200))
	box.add_child(color_rect)

	var button1 = Button.new()
	button1.text = "CHANGE"
	button1.connect("pressed", change_name.bind(label, box))
	box.add_child(button1)

	var button2 = Button.new()
	button2.text = "DELETE"
	box.add_child(button2)
