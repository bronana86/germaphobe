class_name Ball extends RigidBody2D
## Handles ball physics and behavior.

@export var speed: float				## The speed scale of the ball, independent of direction.
@export var starting_direction: Vector2	## The starting direction for the ball.


func _ready() -> void:
	linear_velocity = starting_direction*speed


func _physics_process(_delta) -> void:
	pass
