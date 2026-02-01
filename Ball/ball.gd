class_name Ball extends RigidBody2D
## Handles ball physics and behavior.

@export var speed: float				## The speed scale of the ball, independent of direction.
var speed_min: float = speed
var speed_max: float = speed + 500
@export var speed_step: float			## The rate at which the ball speed can change.
@export var starting_direction: Vector2	## The starting direction for the ball.

@export var pill_sprites: Array			## The three different ball sprites.
var pill_index: int = 0
var score_initial: int


func _ready() -> void:
	linear_velocity = starting_direction*speed
	score_initial = GameManager.current_score


func _physics_process(_delta) -> void:
	if GameManager.current_score - 5000 > score_initial:
		next_pill()


## Checks whether the ball collided with a germ and call the germ to destroy itsself.
func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Germ"):
		var direction = linear_velocity.normalized()
		linear_velocity = direction*speed
		angular_velocity = randf_range(5, 60)
		body._destroy()


## Switches the pill sprites.
func next_pill() -> void:
	$BallSprite.texture = pill_sprites[pill_index]
	pill_index += 1
	score_initial = GameManager.current_score


## Takes scroll inputs to increase ball speed
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				speed += speed_step
			if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				speed -= speed_step
			var direction = linear_velocity.normalized()
			linear_velocity = direction*speed
