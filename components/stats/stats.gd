class_name Stats extends Node


var strength: int = 1
var agility: int = 1
var intelligence: int = 1


func _init(char_class: GlobalParameters.ClassNames) -> void:
	match char_class:
		GlobalParameters.ClassNames.KNIGHT:
			strength = 10
			agility = 5
			intelligence = 3
		GlobalParameters.ClassNames.RANGER:
			strength = 3
			agility = 10
			intelligence = 5
		GlobalParameters.ClassNames.MAGE:
			strength = 3
			agility = 3
			intelligence = 12
