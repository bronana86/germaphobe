extends Area2D

signal ball_bounced

func _ready() ->void:
	body_exited.connect(_on_body_exited)
	
func _on_body_exited(body :Node2D):
	if body is Ball:
		ball_bounced.emit()
