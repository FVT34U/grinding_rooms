class_name StatsComponent extends Node


var _strength: int = 1
var strength: int:
	get: # TODO: сделать фунцию update_stat(ссылка на переменную??) из этого
		var result = float(_strength)
		for mod in stats_modifiers:
			match mod.modifier_type:
				StatsModifier.ModifierType.FLAT: result += mod.modify() # TODO: хуйня
				StatsModifier.ModifierType.PERCENT: result += result / 100 * mod.modify()
		return result

var _agility: int = 1
var _intelligence: int = 1

var stats_modifiers: Array[StatsModifier]

enum CharClass { # TODO: вынести в конфиг файл для расширяемости
	KNIGHT,
	RANGER,
	MAGE,
}


func _init(char_class: CharClass) -> void:
	match char_class: # TODO: вынести в конфиг файл для расширяемости
		CharClass.KNIGHT:
			self._strength = 10
			self._agility = 5
			self._intelligence = 3
		CharClass.RANGER:
			self._strength = 3
			self._agility = 10
			self._intelligence = 5
		CharClass.MAGE:
			self._strength = 3
			self._agility = 3
			self._intelligence = 12


func add_modifier(new_mod: StatsModifier):
	stats_modifiers.append(new_mod)


func remove_modifier(rm_mod: StatsModifier):
	stats_modifiers.erase(rm_mod)
