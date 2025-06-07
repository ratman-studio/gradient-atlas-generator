extends Container
class_name AColorsGenerator
## An abstract base class for color theme generators.
## Classes inheriting from `AColorsGenerator` are expected to implement the
## `generate_colors_theme()` method, which defines how a set of colors is generated.
## This class itself provides a placeholder for that method.

## Abstract method to be implemented by child classes.
## This function should contain the logic for generating a theme of colors.
## @return An Array of Color objects representing the generated color theme.

func generate_colors_theme ():
	## abstract implementatnion
	printerr("Error: 'generate_colors_theme()' called on base ColorsGenerator class. This method should be overridden by a child class.")
	return null
