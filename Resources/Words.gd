extends Resource

var easy_words = []
var medium_words = []
var hard_words = []

var used_easy_words = []
var used_medium_words = []
var used_hard_words = []

func load_words():
	# Получите доступ к ресурсам TextFile
	var easy_txt_file = FileAccess.open("res://Resources/Easy.txt", FileAccess.READ)
	var medium_txt_file = FileAccess.open("res://Resources/Medium.txt", FileAccess.READ)
	var hard_txt_file = FileAccess.open("res://Resources/Hard.txt", FileAccess.READ)
	
	# Загрузите слова из текстовых файлов в массивы
	easy_words = easy_txt_file.get_as_text().split("\n")
	medium_words = medium_txt_file.get_as_text().split("\n")
	hard_words = hard_txt_file.get_as_text().split("\n")

func get_word(difficulty):
	var word = ""
	
	if difficulty == "easy":
		word = getRandomWord(easy_words, used_easy_words)
	elif difficulty == "medium":
		word = getRandomWord(medium_words, used_medium_words)
	elif difficulty == "hard":
		word = getRandomWord(hard_words, used_hard_words)
	
	return word

func getRandomWord(word_list, used_list):
	if used_list.size() == word_list.size():
		used_list.clear()
	
	var random_index = -1
	while random_index == -1 or random_index in used_list:
		random_index = randi() % word_list.size()
	
	used_list.append(random_index)
	
	return word_list[random_index]
