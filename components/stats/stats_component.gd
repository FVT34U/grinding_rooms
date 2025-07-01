class_name StatsComponent extends BaseComponent


var _strength: int = 1
var strength: int:
	get: return _modify_attribute(Globals.StatNames.strength)

var _agility: int = 1
var agility: int:
	get: return _modify_attribute(Globals.StatNames.agility)

var _intelligence: int = 1
var intelligence: int:
	get: return _modify_attribute(Globals.StatNames.intelligence)

var _faith: int = 1
var faith: int:
	get: return _modify_attribute(Globals.StatNames.faith)

var _luck: int = 1
var luck: int:
	get: return _modify_attribute(Globals.StatNames.luck)

var _melee_damage: int = 1
var melee_damage: int:
	get: return _calculate_melee_damage()

var _range_damage: int = 1
var range_damage: int:
	get: return _calculate_range_damage()

var _magic_damage: int = 1
var magic_damage: int:
	get: return _calculate_magic_damage()

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
func _modify_attribute(stat: Globals.StatNames) -> int:
	var stat_str = Globals.stat_str_name(stat)
	var result = float(get("_" + stat_str))
	
	for mod in stats_modifiers:
		if Globals.stat_str_name(mod.stat_name) != stat_str:
			continue
		match mod.modifier_type:
			StatModifier.ModifierType.flat:
				result = clampi(result + mod.modifier_value, 0, 100)
			StatModifier.ModifierType.percent:
				result = clampi(result + result / 100 * mod.modifier_value, 0, 100)
	
	return round(result)


func _modify_characteritic(stat: Globals.StatNames) -> int:
	var stat_str = Globals.stat_str_name(stat)
	var result = float(get("_" + stat_str))
	
	for mod in stats_modifiers:
		if Globals.stat_str_name(mod.stat_name) != stat_str:
			continue
		match mod.modifier_type:
			StatModifier.ModifierType.flat:
				result = result + mod.modifier_value
			StatModifier.ModifierType.percent:
				result = result + result / 100 * mod.modifier_value
	
	return roundi(result)


func _calculate_melee_damage() -> int:
	var rng = Globals.get_rng()
	
	return roundi(
		(
			strength * 2 + \
			agility * 1.5 + \
			_modify_characteritic(Globals.StatNames.melee_damage)
		) * \
		(1 + luck / 100 * rng.randi_range(-1, 1))
	)


func _calculate_range_damage() -> int:
	return \
		agility * 2 + \
		roundi(strength * 1.5) + \
		_modify_characteritic(Globals.StatNames.range_damage)


func _calculate_magic_damage() -> int:
	return \
		intelligence * 3 + \
		_modify_characteritic(Globals.StatNames.magic_damage)


func get_stats_dict() -> Dictionary:
	return {
		"strength": strength,
		"agility": agility,
		"intelligence": intelligence,
		"faith": faith,
		"luck": luck,
		"melee_damage": melee_damage
	}
