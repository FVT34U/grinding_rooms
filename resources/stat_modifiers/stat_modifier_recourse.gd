class_name StatModifier extends Resource

@export var stat_name: Globals.StatNames = Globals.StatNames.strength
@export var mod_type: _modifier_type = _modifier_type.flat
@export var mod_value: float = 0.0

enum _modifier_type {
	flat,
	percent,
}
