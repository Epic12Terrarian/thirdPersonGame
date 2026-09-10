extends Motion

func _enter() -> void:
	print(name)
	last_state = name
	velocity.y = 0
	camera.enter_sprint()

func _state_input(_event: InputEvent) -> void:
	if _event.is_action_pressed("sprint"): #toggle sprint true
		if toggle_sprint:
			camera.exit_sprint()
			finished.emit("run")
	if _event.is_action_released("sprint"): #toggle sprint false
		if !toggle_sprint:
			camera.exit_sprint()
			finished.emit("run")
	if _event.is_action_pressed("aim"):
		camera.exit_sprint()
		finished.emit("aim_run")

func _update(_delta: float) -> void:
	set_direction()
	calculate_velocity(SPRINT_SPEED, direction, _delta)
	
	stamina -= _delta
	
	if stamina <= 0:
		camera.exit_sprint()
		finished.emit("run")
	if !is_on_floor():
		camera.exit_sprint()
		finished.emit("airborne")
	if direction == Vector3.ZERO:
		camera.exit_sprint()
		finished.emit("idle")
