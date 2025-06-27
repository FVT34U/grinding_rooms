class_name BaseItem extends Node

var item_name: String

var stats_modifier: StatsModifier = StatsModifier.new(
	{
		"strength": 5,
		"agility": -2,
	},
	StatsModifier.ModifierType.FLAT, # TODO: как-то переделать, чтобы у каждого стата было
)
