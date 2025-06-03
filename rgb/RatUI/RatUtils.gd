extends Node
class_name RatUtils 

static var _rng:RandomNumberGenerator

static func rng()-> RandomNumberGenerator:
	if not _rng:
		_rng = RandomNumberGenerator.new()
	return _rng

## Add unique elements from one array to another.
## @param array The array to which unique elements will be added.
## @param elements The array containing elements to be added.
static func add_unique(array: Array, elements: Array) -> void:
	for element in elements: if not array.has(element):	array.append(element)
	
# takes an array and then slices that array into smaller parts then puts them all into one 2D array.
# https://www.reddit.com/r/godot/comments/e6ae27/how_do_i_slice_an_array_like_this_in_godot/
static func chunk(arr, size):
	var ret = []
	var i = 0
	var j = -1
	for el in arr:
		if i % size == 0:
			ret.push_back([])
			j += 1;
		ret[j].push_back(el)
		i += 1
	return ret
