extends Motion

func _enter() -> void:
	print(name)

func _update(_delta: float) -> void:
	set_direction()
	calculate_velocity(SPEED, direction, _delta)
	
	if direction == Vector3.ZERO:
		finished.emit("Idle")
