extends CharacterBody2D

@export var left_right_speed :float #this represents the left and right speed of the paddlee
 #speed in pixels/second. The speed must be a Vector2, but we are only conncerned witht the x componentt.

func _physics_process(delta: float) -> void:
	var speed = Vector2(left_right_speed,0)
	
	velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity = speed
	if Input.is_action_pressed("move_left"):
		velocity = -1*speed
	move_and_collide(velocity*delta)
