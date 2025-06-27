class_name StatsModifier extends Node


var modifier_type: ModifierType = ModifierType.FLAT:
	get: return modifier_type

var modifier_list: Dictionary = {}

enum ModifierType {
	FLAT,
	PERCENT
}


func _init(mod_list: Dictionary, type: ModifierType = ModifierType.FLAT) -> void:
	self.modifier_type = type
	self.modifier_list = mod_list
