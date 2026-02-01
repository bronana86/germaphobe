class_name BossGerm extends StaticBody2D

var row_position: Vector2
@export var germ_weight: float

@export var point_value: int


func _process(_delta) -> void:
	# manually set the germ position in the row every frame
	position = row_position


## Destroys the germ when it comes into contact with the pill.
func _destroy() -> void:
	GameManager.current_score += point_value
	
	$GermSprite.visible = false
	$GermCollider.set_deferred("disabled", true)
	$DeathPlayer.play()
	await get_tree().create_timer($DeathPlayer.stream.get_length()).timeout
	
	GameManager.obtain_sneeze()
	
	queue_free() # you serve ZERO purpose.
