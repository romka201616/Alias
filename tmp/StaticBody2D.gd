extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	modulate = Color(Color.AQUA , 0.7)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Card.if_dragging:
		visible = true
	else:
		visible = false
