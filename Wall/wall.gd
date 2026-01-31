extends StaticBody2D

#@export var left_right_speed :float #this represents the left and right speed of the paddlee
 ##speed in pixels/second. The speed must be a Vector2, but we are only conncerned witht the x componentt.
#
#func _physics_process(delta: float) -> void:
	#
	#if Input.is_action_pressed("move_right"):
		#position.x += left_right_speed
	#if Input.is_action_pressed("move_left"):
		#position.x -=left_right_speed
	#
