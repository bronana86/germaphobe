class_name Gernm extends RigidBody2D

var row_position: Vector2



func _process(_delta) -> void:
	# manually set the germ position in the row every frame
	position = row_position
