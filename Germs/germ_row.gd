class_name GermRow extends Node2D
## Holds germ positions, spawning, and movement.

@export var germ_spaces: int				## The number of germ spaces in this row. Used to generate the germ positions.
var germ_positions: Array[Vector2]			# The positions of the germs in this row.
@export var germ_scale: float				## Size of the germ sprites, in pixles. Used to generate spacing.

## Create an instance of the germ to instantiate at row generation.
var germ_scene = preload("res://Germs/germ.tscn")


## Initiate row information and spawn germs
func _ready() -> void:
	for i in range(0, germ_spaces): # iterates through the number of spaces and adds a position scaled to the sprite size for each germ.
		germ_positions.append(Vector2(germ_scale/2 + (i*(germ_scale + germ_scale/2)), germ_scale/2))
		# let me know if you need me to break down this equation, anton.
	
	# Instantiate the germ objects and add them to a row.
	for pos in germ_positions:
		var germ = germ_scene.instantiate()
		add_child(germ)
		germ.position = pos
