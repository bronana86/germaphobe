class_name GameManager extends Node2D


static var current_score: int = 0
static var spawn_timer: float
static var sneeze: bool = false

static var sneeze_scene = preload("uid://dioonvpq1e16w")

static func enemy_death(point_value: int) -> void:
	current_score += point_value


static func obtain_sneeze() -> void:
	sneeze = true
