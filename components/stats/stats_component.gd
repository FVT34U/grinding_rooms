class_name StatsComponent extends BaseComponent


var _strength: int = 1
var strength: int:
	get: return _modify_main_stat(Globals.StatNames.strength)

var _agility: int = 1
var agility: int:
	get: return _modify_main_stat(Globals.StatNames.agility)

var _intelligence: int = 1
var intelligence: int:
	get: return _modify_main_stat(Globals.StatNames.intelligence)

var _faith: int = 1
var faith: int:
	get: return _modify_main_stat(Globals.StatNames.faith)

var _luck: int = 1
var luck: int:
	get: return _modify_main_stat(Globals.StatNames.luck)

var _melee_damage: int = 1
var melee_damage: int:
	get: return _calculate_melee_damage()

var stats_modifiers: Array[StatModifier] = []


func set_character_class(char_cls: CharacterClass) -> void:
	_strength = char_cls.strength
	_agility = char_cls.agility
	_intelligence = char_cls.intelligence
	_faith = char_cls.faith
	_luck = char_cls.luck


func add_modifier(new_mod: StatModifier) -> void:
	stats_modifiers.append(new_mod)


func remove_modifier(rm_mod: StatModifier) -> void:
	stats_modifiers.erase(rm_mod)


## strength, agility, intelligence, faith, luck and other like this in the future
func _modify_main_stat(stat: Globals.StatNames) -> int:
	var stat_str = Globals.stat_to_str(stat)
	var result = float(get("_" + stat_str))
	
	for mod in stats_modifiers:
		if Globals.stat_to_str(mod.stat_name) != stat_str:
			continue
		match mod.modifier_type:
			StatModifier.ModifierType.flat:
				result = clampi(result + mod.modifier_value, 0, 100)
			StatModifier.ModifierType.percent:
				result = clampi(result + result / 100 * mod.modifier_value, 0, 100)
	
	return round(result)


func _modify_stat(stat: Globals.CharacteristicNames) -> int:
	var stat_str = Globals.char_to_str(stat)
	var result = float(get("_" + stat_str))
	return round(result)


func _calculate_melee_damage() -> int:
	return \
		strength * 2 + \
		roundi(agility * 1.5) + \
		_modify_stat(Globals.CharacteristicNames.melee_damage) # TODO: rework...


func get_stats_dict() -> Dictionary:
	return {
		"strength": strength,
		"agility": agility,
		"intelligence": intelligence,
		"faith": faith,
		"luck": luck,
	}
