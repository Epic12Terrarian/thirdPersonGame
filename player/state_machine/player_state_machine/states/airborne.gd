extends Motion

func _enter() -> void:
	print(name)

func _update(_delta: float) -> void:
	calculate_velocity(SPEED,direction,_delta)
	calculate_gravity(_delta)
	
	if direction == Vector3.ZERO:
		finished.emit("idle")
