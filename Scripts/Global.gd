extends Node2D

var words : Array[Word]

var next_team_ready_count : int
var game_ready_count : int
var score_ready_count : int
var final_ready_count : int

var is_dragging : bool = false

var round : Round

var teams : Array[Team] = []
var teams_amount : int
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
	next_team_ready_count = 0
	game_ready_count = 0
	score_ready_count = 0
	final_ready_count = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
