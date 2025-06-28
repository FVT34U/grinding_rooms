class_name Stats extends Node


var strength: int = 1
var agility: int = 1
var intelligence: int = 1


func _init(char_class: Globals.ClassNames) -> void:
	match char_class:
		Globals.ClassNames.knight:
			strength = 10
			agility = 5
			intelligence = 3
		Globals.ClassNames.ranger:
			strength = 3
			agility = 10
			intelligence = 5
		Globals.ClassNames.mage:
			strength = 3
			agility = 3
			intelligence = 12
