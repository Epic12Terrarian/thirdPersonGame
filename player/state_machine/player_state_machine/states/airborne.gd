extends Motion

func _enter() -> void:
	print(name)
	animation_state_change.emit("fall")
	last_state = name


func _update(_delta: float) -> void:
	calculate_velocity(stats.speed,direction,_delta)
	calculate_gravity(_delta)
	
	if is_on_floor():
		finished.emit("idle")
		
