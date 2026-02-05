class_name Ball extends RigidBody2D
## Handles ball physics and behavior.

@export var speed: float				## The speed scale of the ball, independent of direction.
const SPEED_MIN: float = 500
const SPEED_MAX: float = 1000
@export var speed_step: float			## The rate at which the ball speed can change.
@export var starting_direction: Vector2	## The starting direction for the ball.

@export var pill_sprites: Array[CompressedTexture2D]			## The three different ball sprites.
var pill_index: int = 0
var score_initial: int


func _ready() -> void:
	linear_velocity = starting_direction*speed
	score_initial = GameManager.current_score


func _physics_process(_delta) -> void:
	pass


## Checks whether the ball collided with a germ and call the germ to destroy itsself.
func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Germ"):
		var direction = linear_velocity.normalized()
		linear_velocity = direction*speed
		angular_velocity = randf_range(5, 60)
		body._destroy()




## Takes scroll inputs to increase ball speed
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == MOUSE_BUTTON_WHEEL_UP and speed < SPEED_MAX:
				speed += speed_step
			if event.button_index == MOUSE_BUTTON_WHEEL_DOWN and speed > SPEED_MIN:
				speed -= speed_step
			var direction = linear_velocity.normalized()
			linear_velocity = direction*speed
	
	elif event is InputEventKey:
		if event.is_pressed() and event.keycode == KEY_SPACE and GameManager.sneeze:
			var direction = Vector2(randf_range(-0.5,0.5) ,-1).normalized()
			linear_velocity = direction*900
