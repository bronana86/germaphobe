class_name HighScore extends Label

var high_score: int


func _ready() -> void:
	_display_high_score()


func _process(_delta) -> void:
	if GameManager.current_score > high_score:
		high_score = GameManager.current_score
		text = str(high_score)
		GameManager.high_score = high_score

func _display_high_score() -> void:
	var file = FileAccess.open("res://Score/high_score.txt", FileAccess.READ)
	text = file.get_as_text()
	high_score = int(file.get_as_text())
	GameManager.high_score = high_score
	file.close()
	return
