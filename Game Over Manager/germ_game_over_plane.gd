extends Area2D

signal game_ended

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body :Node2D):
	pass
	#if body is Germ:
		#game_ended.emit()
