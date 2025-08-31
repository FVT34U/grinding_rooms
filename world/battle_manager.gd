class_name BattleManager extends Node2D


var time: float = 0.0
var minutes: int = 0
var seconds: int = 0

## once in a second, values: 0-59
signal amount_of_seconds_changed(new_seconds: int)
## once in a minute, values: any positive int
signal amount_of_minutes_changed(new_minutes: int)
## once in a second, values: any positive float
signal time_changed(new_time: float)


func _process(delta: float) -> void:
	time += delta
	
	_update_time(time)


func _update_time(time: float):
	var old_secs = seconds
	seconds = floori(time) - minutes * 60
	
	var old_mins = minutes
	minutes = floori(time / 60)
	
	if old_mins < minutes:
		amount_of_minutes_changed.emit(minutes)
		amount_of_seconds_changed.emit(0)
		time_changed.emit(time)
		return
	
	if old_secs < seconds:
		amount_of_seconds_changed.emit(seconds)
		time_changed.emit(time)
