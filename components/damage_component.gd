class_name DamageComponent extends BaseComponent


var _attribute_comp: AttributeComponent

var _physical_damage: int = 0
var physical_damage: int:
	get: return roundi(_attribute_comp.agility * 1.5) + _attribute_comp.strength * 2

var _magic_damage: int = 0
var magic_damage: int:
	get: return roundi(_attribute_comp.agility * 1.5) + _attribute_comp.intelligence * 2

func _init(attribute_comp: AttributeComponent) -> void:
	if attribute_comp == null: return
	_attribute_comp = attribute_comp
	
	component_name = "DamageComponent"
