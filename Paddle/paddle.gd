class_name Mask extends StaticBody2D
@onready var left_collision_area: Area2D = %LeftCollisionArea
@onready var right_collision_area: Area2D = %RightCollisionArea

@export var left_right_speed :float #this represents the left and right speed of the paddlee
 #speed in pixels/second. The speed must be a Vector2, but we are only conncerned witht the x componentt.

#These two bools are changed when the collision boxes detect a wall on either side of the paddle
var wall_on_right_side :bool = false
var wall_on_left_side :bool = false


@onready var mask_collision_counter: Area2D = %MaskCollisionCounter

func _ready() ->void:
	left_collision_area.body_entered.connect(_on_left_area_entered)
	left_collision_area.body_exited.connect(_on_left_area_exited)
	right_collision_area.body_entered.connect(_on_right_area_entered)
	right_collision_area.body_exited.connect(_on_right_area_exited)
	mask_collision_counter.connect("ball_bounced", _on_ball_bounced)
	generate_bounce_damage_array()

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


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.is_pressed() and event.keycode == KEY_SPACE and GameManager.sneeze:
			turn_off_mask()
			mask_sprite.texture = MaskSprite1
			collision_counter_1.set_deferred("disabled", false)
			mask_collision_1.set_deferred("disabled",false)
			GameManager.sneeze = false
			generate_bounce_damage_array()
			ball_bounce_counter = 0

##The following scripts change the shape and 
##collision box of the mask
var bounce_damage_array :Array[int] = []
var ball_bounce_counter :int

#Reference to Sprite2D 
@onready var mask_sprite: Sprite2D = %MaskSprite

#Mask Sprites
var MaskSprite1 = preload("uid://duesdkubpffhn")
var MaskSprite2 = preload("uid://pmliyc5fseo5")
var MaskSprite3 = preload("uid://ddq6r8sy2j4q6")
var MaskSprite4 = preload("uid://06wfghvq2u0v")

#Bounce Collision Boxes
@onready var mask_collision_1: CollisionShape2D = %MaskCollision1
@onready var mask_collision_2: CollisionPolygon2D = %MaskCollision2
@onready var mask_collision_3: CollisionPolygon2D = %MaskCollision3
@onready var mask_collision_4: CollisionPolygon2D = %MaskCollision4

#Collision Counter Boxes
@onready var collision_counter_1: CollisionShape2D = %CollisionCounter1
@onready var collision_counter_2: CollisionPolygon2D = %CollisionCounter2
@onready var collision_counter_3: CollisionPolygon2D = %CollisionCounter3
@onready var collision_counter_4: CollisionPolygon2D = %CollisionCounter4


func generate_bounce_damage_array() ->void:
	bounce_damage_array = [0,0,0]
	bounce_damage_array[0] += randi_range(3,5)
	bounce_damage_array[1] += randi_range(7,10)
	bounce_damage_array[2] += randi_range(12,15)
	
func _on_ball_bounced() ->void:
	ball_bounce_counter += 1
	
	if ball_bounce_counter > bounce_damage_array[2]:
		turn_off_mask()
		mask_sprite.texture = MaskSprite4
		collision_counter_4.set_deferred("disabled", false)
		mask_collision_4.set_deferred("disabled",false)
		return
	if ball_bounce_counter > bounce_damage_array[1]:
		turn_off_mask()
		mask_sprite.texture = MaskSprite3
		collision_counter_3.set_deferred("disabled", false)
		mask_collision_3.set_deferred("disabled",false)
		return
	if ball_bounce_counter > bounce_damage_array[0]:
		turn_off_mask()
		mask_sprite.texture = MaskSprite2
		collision_counter_2.set_deferred("disabled", false)
		mask_collision_2.set_deferred("disabled",false)
		return


func turn_off_mask() ->void:
	#var mask_collision_array :Array = [mask_collison_1, mask_collision_2, mask_collision_3, mask_collision_4] 
	#var collision_counter_array :Array = [collision_counter_1, collision_counter_2,collision_counter_3, collision_counter_4]

	mask_collision_1.set_deferred("disabled", true)
	mask_collision_2.set_deferred("disabled", true)
	mask_collision_3.set_deferred("disabled", true)
	mask_collision_4.set_deferred("disabled", true)
	collision_counter_1.set_deferred("disabled", true)
	collision_counter_2.set_deferred("disabled", true)
	collision_counter_3.set_deferred("disabled", true)
	collision_counter_4.set_deferred("disabled", true)
