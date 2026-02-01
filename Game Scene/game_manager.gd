class_name GameManager extends Node2D


static var current_score: int = 0
static var spawn_timer: float
static var sneeze: bool

static var sneeze_scene = preload("uid://dioonvpq1e16w")

static func enemy_death(point_value: int) -> void:
	current_score += point_value


static func obtain_sneeze() -> void:
	sneeze = true
	
	var sneeze_child = sneeze_scene.instantiate()
	sneeze_child.position = Vector2(150, 860)
