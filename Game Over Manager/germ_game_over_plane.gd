extends Area2D

signal game_ended
@onready var germ_scanner: CollisionShape2D = %GermScanner

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	
func _process(delta: float) -> void:
	position.x += 10
	if position.x == 2000:
		position.x = -200

func _on_body_entered(body :Node2D):
	if body is not Ball and body is not Wall and body is not Mask:
		print("game Over germ")
		game_ended.emit()
