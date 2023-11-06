extends Node2D

var teams_amount : int

var teams : Array[Team] = []

var teams_positions = []

var teams_positions_examples = [
	[42, 632],
	[545, 632],
	[42, 966],
	[545, 966],
	[42, 1303],
	[545, 1303]
]

var teams_example = [
	"Орлы",
	"Коты",
	"Собаки",
	"Петухи",
	"Курочки",
	"Хомяки",
	"Лоси",
	"Медведи",
]

var teams_names = [
	"Орлы",
	"Коты",
	"Собаки",
	"Петухи",
	"Курочки",
	"Хомяки",
	"Лоси",
	"Медведи",
]

# Called when the node enters the scene tree for the first time.
func _ready():
	teams_amount = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
