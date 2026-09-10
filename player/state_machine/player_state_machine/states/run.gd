extends Motion

func _enter() -> void:
	print(name)
	last_state = name
	velocity.y = 0

func _state_input(_event: InputEvent) -> void:
	if _event.is_action_pressed("sprint") and stamina > 0.5:
		finished.emit("sprint")
	if _event.is_action_pressed("aim"):
		finished.emit("aim_run")

func _update(_delta: float) -> void:
	set_direction()
	calculate_velocity(SPEED, direction, _delta)
	
	if stamina <= MAX_STAMINA:
		stamina += _delta / RUN_STAMINA_REGEN_MODIFIER
	
	if !is_on_floor():
		finished.emit("airborne")
	if direction == Vector3.ZERO:
		finished.emit("idle")
