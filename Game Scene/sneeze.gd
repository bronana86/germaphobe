class_name Sneeze extends AnimatedSprite2D



func _process(_delta) -> void:
	global_position = Vector2(150, 860)


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.is_pressed() and event.keycode == KEY_SPACE and GameManager.sneeze:
			$Sneezer.play()
			await get_tree().create_timer($Sneezer.stream.get_length()).timeout
			visible = false
