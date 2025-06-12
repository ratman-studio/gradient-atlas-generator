extends Container
class_name AGradientsGenerator
## An abstract base class for gradients generators.
## Classes inheriting from `AGradientsGenerator` are expected to implement the
## `generate_gradients()` method, which defines how a set of gradients is generated.
## This class itself provides a placeholder for that method.

## Abstract method to be implemented by child classes.
## This function should contain the logic for generating a array of Gradients from given Array of colors.
## @return An Array of 1DGradients objects representing the generated gradient.

func generate_gradients (colors: Array[Color]) -> Array[Gradient]:
	## abstract implementatnion
	printerr("Error: 'generate_gradients()' called on base GradientsGenerator class. This method should be overridden by a child class.")
	print("Error: 'generate_gradients()' called on base GradientsGenerator class. This method should be overridden by a child class.")
	return []
