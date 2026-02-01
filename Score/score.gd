class_name Score extends Label

var current_score = 0

func _ready() -> void:
	text = str(current_score)


func _update_score(s: int) -> void:
	current_score += s
	text = str(current_score)

func _process(_delta) -> void:
	text = str(GameManager.current_score)
