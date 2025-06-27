class_name StatsComponent extends BaseComponent


var _strength: int = 1
var strength: int:
	get: return _modify_stat("_strength")

var _agility: int = 1
var agility: int:
	get: return _modify_stat("_agility")

var _intelligence: int = 1
var intelligence: int:
	get: return _modify_stat("_intelligence")

var stats_modifiers: Array[StatsModifier] = []

@export
var char_class: CharClass = CharClass.KNIGHT

enum CharClass {
	KNIGHT,
	RANGER,
	MAGE,
}


func _init() -> void:
	match self.char_class:
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


func add_modifier(new_mod: StatsModifier) -> void:
	stats_modifiers.append(new_mod)


func remove_modifier(rm_mod: StatsModifier) -> void:
	stats_modifiers.erase(rm_mod)


func _modify_stat(stat_name: String) -> int:
	var result = float(get(stat_name))
	var local_stat_name = stat_name.get_slice("_", 0)
	for mod in stats_modifiers:
		if local_stat_name not in mod.modifier_list.keys(): continue
		match mod.modifier_type:
			StatsModifier.ModifierType.FLAT:
				result = clamp(result + mod.modifier_list[local_stat_name], 0, 100)
			StatsModifier.ModifierType.PERCENT:
				result = clamp(result + result / 100 * mod.modifier_list[local_stat_name], 0, 100) 
	return round(result)
