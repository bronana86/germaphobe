class_name GermRow extends Node2D
## Holds germ positions, spawning, and movement.
var germ_positions: Array[Vector2]			# The positions of the germs in this row.

## Create an instance of the germ to instantiate at row generation.
var germ_scene = preload("res://Germs/germ.tscn")
var boss_germ_scene = preload("uid://bm4g780umqh04")


## Initiate row information and spawn germs
func _ready() -> void:
	var g_sp: int = get_parent().germ_spaces
	var g_sc: float = get_parent().germ_scale
	for i in range(0, g_sp): # iterates through the number of spaces and adds a position scaled to the sprite size for each germ.
		germ_positions.append(Vector2(g_sc/2 + (i*(g_sc + g_sc/2)), g_sc/2))
		# let me know if you need me to break down this equation, anton.
	
	# Instantiate the germ objects and add them to a row.
	for pos in germ_positions:
		spawn_germ(pos)


## Spawns the different types of germs.
func spawn_germ(pos: Vector2) -> void:
	var rand_germ: int = randi_range(0, 50)
	var germ: Node
	
	
	if rand_germ > 48:
		germ = boss_germ_scene.instantiate()
		add_child(germ)
		germ.position = pos
		germ.row_position = pos
		return
	
	germ = germ_scene.instantiate()
	add_child(germ)
	germ.weighted_random_animation()
	germ.position = pos
	germ.row_position = pos
