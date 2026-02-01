class_name GameManager extends Node2D


static var current_score: int = 0
static var spawn_timer: float
	


static func enemy_death(point_value: int, boss: bool) -> void:
	current_score += point_value
