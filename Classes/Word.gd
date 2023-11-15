extends Control

class_name Word

var text : String
var accepted : bool

func _init(new_text : String, new_accepted : bool):
	text = new_text
	accepted = new_accepted
