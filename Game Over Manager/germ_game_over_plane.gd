extends Area2D

signal game_ended

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body :Node2D):
	if body is not Ball and body is not Wall and body is not Mask:
		print("game Over germ")
		game_ended.emit()
