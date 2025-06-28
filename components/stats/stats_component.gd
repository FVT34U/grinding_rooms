class_name StatsComponent extends BaseComponent


var stats: Stats

var stats_modifiers: Array[StatsModifier] = []


func _init(cls_name: GlobalParameters.ClassNames) -> void:
	stats = Stats.new(cls_name)


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
