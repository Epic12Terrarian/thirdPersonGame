extends Motion

func _enter() -> void:
	print(name)
	last_state = name


func _update(_delta: float) -> void:
	calculate_velocity(SPEED,direction,_delta)
	calculate_gravity(_delta)
	
	if is_on_floor():
		finished.emit("idle")
		
