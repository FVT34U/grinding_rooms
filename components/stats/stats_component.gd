class_name StatsComponent extends BaseComponent


var _strength: int = 1
var strength: int:
	get: return _modify_stat(Globals.StatNames.strength)

var _agility: int = 1
var agility: int:
	get: return _modify_stat(Globals.StatNames.agility)

var _intelligence: int = 1
var intelligence: int:
	get: return _modify_stat(Globals.StatNames.intelligence)

var _faith: int = 1
var faith: int:
	get: return _modify_stat(Globals.StatNames.faith)

var stats_modifiers: Array[StatModifier] = []


func _init(char_cls: CharacterClass) -> void:
	self._strength = char_cls.strength
	self._agility = char_cls.agility
	self._intelligence = char_cls.intelligence
	self._faith = char_cls.faith


func add_modifier(new_mod: StatModifier) -> void:
	stats_modifiers.append(new_mod)


func remove_modifier(rm_mod: StatModifier) -> void:
	stats_modifiers.erase(rm_mod)


func _modify_stat(stat: Globals.StatNames) -> int:
	
	for mod in stats_modifiers:
		match mod.modifier_type:
			StatsModifier.ModifierType.FLAT:
				result = clamp(result + mod.modifier_list[local_stat_name], 0, 100)
			StatsModifier.ModifierType.PERCENT:
				result = clamp(result + result / 100 * mod.modifier_list[local_stat_name], 0, 100) 
	return round(result)
