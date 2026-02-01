class_name Gernm extends StaticBody2D

var row_position: Vector2



func _process(_delta) -> void:
	# manually set the germ position in the row every frame
	position = row_position


## Destroys the germ when it comes into contact with the pill.
func _destroy() -> void:
	# signal to update score.
	queue_free() # you server ZERO purpose.
