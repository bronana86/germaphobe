extends RichTextLabel


func _process(_delta) -> void:
	text = "Score:\n" + str(GameManager.current_score)
