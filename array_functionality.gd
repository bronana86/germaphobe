class_name Array2D

extends Resource

## Class for creating 2D arrays and accessing their data.


# Some basic definitions for determining array size.
var x_size: int
var y_size: int
var cells: int
var array: Array


## Constructor for creating a new 2D array and saving the parameters to the object.
func _init(x : int, y : int):
	x_size = x
	y_size = y
	cells = x_size * y_size
	array = [cells]
	
	for i in cells:
		array.append(null)


## Return the x value of the array.
func get_x() -> int:
	return x_size


## Return the y value of the array.
func get_y() -> int:
	return y_size


## Return the 1D array.
func get_array1D() -> Array:
	return array

## Return an array value based on given index.
func get_idx(x : int, y : int):
	var idx = (y * x_size) + x
	return array[idx]



## Set an array value based on given index.
func set_idx(x : int, y : int, val) -> void:
	var idx = (y * x_size) + x
	array[idx] = val


## Reset the array to all null values.
func reset() -> void:
	if not array:
		print_debug("No values in array.")
		return
	
	for item in array:
		item = null


## Specifically for expanding the array. If values need to be removed, see trim().
func set_size(x: int, y: int) -> void:
	if not array:
		print_debug("No values in array.")
		return
	
	var new_size: int = x * y
	for i in range(cells, new_size):
		array.append(null)


## Returns a row based on a given string key, returning all values following that key.
func get_row(key: String) -> Array:
	var row: Array
	for y in y_size:
		if get_idx(0, y) == key:
			for x in range(1, x_size):
				row.append(get_idx(x, y))
	
	assert(row, "Could not find the given row")
	
	return row
