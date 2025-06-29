class_name StatModifier extends Resource

@export var stat_name: Globals.StatNames = Globals.StatNames.strength
@export var modifier_type: ModifierType = ModifierType.flat
@export var modifier_value: float = 0.0

enum ModifierType {
	flat,
	percent,
}
