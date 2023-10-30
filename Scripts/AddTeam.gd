extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	var vbox = VBoxContainer.new()
	add_child(vbox)

	var label = Label.new()
	label.text = "This is a custom panel"
	vbox.add_child(label)

	var color_rect = ColorRect.new()
	color_rect.color = Color(1, 0, 0)
	color_rect.set_size(Vector2(200, 200))
	vbox.add_child(color_rect)

	var button1 = Button.new()
	button1.text = "Button 1"
	vbox.add_child(button1)

	var button2 = Button.new()
	button2.text = "Button 2"
	vbox.add_child(button2)
