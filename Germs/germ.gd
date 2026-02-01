class_name Germ extends StaticBody2D

var row_position: Vector2
@export var germ_weight: float

## The frequency for which each animation appears. Position of the weight value must match the position of the animation in the SpriteFrames.
@export var anim_weights: Array[float]
var anim_weight_total: float = 0
var point_value: int

func _ready() -> void:
	for value in anim_weights:
		anim_weight_total += value

func _process(_delta) -> void:
	# manually set the germ position in the row every frame
	position = row_position


## Destroys the germ when it comes into contact with the pill.
func _destroy() -> void:
	GameManager.current_score += point_value
	queue_free() # you serve ZERO purpose.


## Selects a random animation.
func random_animation() -> void:
	var anim: float = randf_range(0, 4)
	anim = snappedf(anim, 1)
	match anim:
				0.0:
					$GermSprite.animation = "germ_1"
					point_value = 75
				1.0:
					$GermSprite.animation = "germ_2"
					point_value = 50
				2.0:
					$GermSprite.animation = "germ_3"
					point_value = 25
				3.0:
					$GermSprite.animation = "germ_4"
					point_value = 150


## Finds an animation based on it's weight value
func weighted_random_animation() -> void:
	var anim_num: float = randf_range(0, anim_weight_total)
	
	for value in anim_weights:
		if value >= anim_num:
			match anim_weights.find(value):
				0:
					$GermSprite.animation = "germ_1"
					point_value = 75
				1:
					$GermSprite.animation = "germ_2"
					point_value = 50
				2:
					$GermSprite.animation = "germ_3"
					point_value = 25
				3:
					$GermSprite.animation = "germ_4"
					point_value = 150
			return
		else: anim_num -= value
	
	# If an animation isn't set, return the last one in the list. This shouldn't happen.
	print_debug("Couldn't find a random weighted animation")
	$GermSprite.animation = "germ_4"
