class_name GermManager extends Node2D

## Transfer this code over to a manager dedicated to controlling germ spawns when the game scene is made.

@export_category("Germ Spawning")
@export var starting_rows: int
## @DEPRECATED:  var spawn_point: Vector2 | new rows are spawning at the parent location. will need a dedicated parent.
@export var spawn_time: float					## Time between rows spawning
@export var germ_spaces: int					## The number of germ spaces in this row. Used to generate the germ positions.
@export var germ_scale: float				## Size of the germ sprites, in pixles. Used to generate spacing.

## The PackedScene of the germ row that's preloaded for easy instantiation.
var germ_row_prefab: PackedScene = preload("res://Germs/germ_row.tscn")


## Generate the rows along the starting points.
func _ready() -> void:
	# manually set three starting rows.
	for i in range(0, starting_rows):
		var germ_row = germ_row_prefab.instantiate()
		add_child(germ_row)
		germ_row.position.y = germ_scale*i
	
	# Start the row spawning timer.
	spawn_row()


func _process(_delta) -> void:
	pass


## Wait for a given amount of time, move the rows down, and spawn a new row.
func spawn_row() -> void:
	await get_tree().create_timer(spawn_time).timeout
	var children = get_children()
	for child in children:
		child.position.y += germ_scale
	await get_tree().create_timer(0.2).timeout
	spawn_germ_row()
	# reset the timer
	spawn_row()


## Spawns a row of germs.
func spawn_germ_row() -> void:
	var germ_row = germ_row_prefab.instantiate()
	add_child(germ_row)
