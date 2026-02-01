class_name HighScore extends Label


func _ready() -> void:
	_display_high_score()

func _display_high_score() -> void:
	var file = FileAccess.open("res://Score/high_score.dat", FileAccess.READ)
	text = file.get_as_text()
	file.close()
	return


func _record_high_score(score: int) -> void:
	var file = FileAccess.open("res://Score.high_score.dat", FileAccess.WRITE)
	file.store_string(str(score))
	file.close()
	return
