class_name MeTimer extends Node

func _create(time: float, function: Callable) -> void:
	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = time
	timer.one_shot = true
	timer.autostart = true
	timer.timeout.connect(function)
	timer.start()
