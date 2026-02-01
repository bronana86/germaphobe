class_name Ball extends RigidBody2D
## Handles ball physics and behavior.

@export var speed: float				## The speed scale of the ball, independent of direction.
@export var starting_direction: Vector2	## The starting direction for the ball.


func _ready() -> void:
	linear_velocity = starting_direction*speed


func _physics_process(_delta) -> void:
	pass


## Checks whether the ball collided with a germ and call the germ to destroy itsself.
func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Germ"):
		var direction = linear_velocity.normalized()
		linear_velocity = direction*speed
		body._destroy()
