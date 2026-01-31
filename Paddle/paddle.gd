extends StaticBody2D
@onready var left_collision_area: Area2D = %LeftCollisionArea
@onready var right_collision_area: Area2D = %RightCollisionArea

@export var left_right_speed :float #this represents the left and right speed of the paddlee
 #speed in pixels/second. The speed must be a Vector2, but we are only conncerned witht the x componentt.

#These two bools are changed when the collision boxes detect a wall on either side of the paddle
var wall_on_right_side :bool = false
var wall_on_left_side :bool = false

func _ready() ->void:
	left_collision_area.body_entered.connect(_on_left_area_entered)
	left_collision_area.body_exited.connect(_on_left_area_exited)
	right_collision_area.body_entered.connect(_on_right_area_entered)
	right_collision_area.body_exited.connect(_on_right_area_exited)

func _physics_process(_delta: float) -> void:
	
	if Input.is_action_pressed("move_right") and wall_on_right_side == false:
		position.x += left_right_speed
	if Input.is_action_pressed("move_left") and wall_on_left_side == false:
		position.x -=left_right_speed
	
func _on_left_area_entered(body :Node2D) ->void:
	if body is Wall:
		wall_on_left_side = true
		
func _on_left_area_exited(body :Node2D) ->void:
	if body is Wall:
		wall_on_left_side = false

func _on_right_area_entered(body :Node2D) ->void:
	if body is Wall:
		wall_on_right_side = true

func _on_right_area_exited(body :Node2D) ->void:
	if body is Wall:
		wall_on_right_side = false
