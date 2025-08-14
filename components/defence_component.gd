class_name DefenceComponent extends BaseComponent


var _attribute_comp: AttributeComponent

var _physical_defence: int = 0
var physical_defence: int:
	get: return roundi(_attribute_comp.agility * .5) + \
		 roundi(_attribute_comp.strength * 1.2)

var _magic_defence: int = 0
var magic_defence: int:
	get: return roundi(_attribute_comp.agility * .5) + \
		 roundi(_attribute_comp.intelligence * 1.2)


func _init(attribute_comp: AttributeComponent) -> void:
	if attribute_comp == null: return
	_attribute_comp = attribute_comp
	
	component_name = "DefenceComponent"
