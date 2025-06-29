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


func set_character_class(char_cls: CharacterClass) -> void:
	self._strength = char_cls.strength
	self._agility = char_cls.agility
	self._intelligence = char_cls.intelligence
	self._faith = char_cls.faith


func add_modifier(new_mod: StatModifier) -> void:
	stats_modifiers.append(new_mod)


func remove_modifier(rm_mod: StatModifier) -> void:
	stats_modifiers.erase(rm_mod)


func _modify_stat(stat: Globals.StatNames) -> int:
	var stat_str = Globals.stat_to_str(stat)
	var result = float(get("_" + stat_str))
	
	for mod in stats_modifiers:
		print(Globals.stat_to_str(mod.stat_name) + " " + stat_str)
		if Globals.stat_to_str(mod.stat_name) != stat_str:
			continue
		match mod.modifier_type:
			StatModifier.ModifierType.flat:
				result = clampi(result + mod.modifier_value, 0, 100)
			StatModifier.ModifierType.percent:
				result = clampi(result + result / 100 * mod.modifier_value, 0, 100)
	print(result)
	return round(result)


func get_stats_dict() -> Dictionary:
	return {
		"strength": self.strength,
		"agility": self.agility,
		"intelligence": self.intelligence,
		"faith": self.faith,
	}
