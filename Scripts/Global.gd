extends Node2D

var words : Array[Word]

var next_team_ready_count : int
var game_ready_count : int

var is_dragging : bool = false

var round : Round

var teams : Array[Team] = []
var teams_amount : int
var teams_positions = []
var teams_positions_examples = [
	Vector2(42, 632),
	Vector2(545, 632),
	Vector2(42, 966),
	Vector2(545, 966),
	Vector2(42, 1303),
	Vector2(545, 1303)
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
	next_team_ready_count = 0
	game_ready_count = 0
