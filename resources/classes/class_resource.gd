class_name CharacterClass extends Resource

@export var cls: _classes = _classes.knight

@export var strength: int = 1
@export var agility: int = 1
@export var intelligence: int = 1
@export var faith: int = 1

enum _classes {
	knight,
	ranger,
	mage,
	warrior,
	priest,
}
