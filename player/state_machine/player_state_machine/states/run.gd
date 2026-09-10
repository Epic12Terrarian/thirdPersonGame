extends Motion

func _enter() -> void:
	print(name)
	animation_state_change.emit("run")
	last_state = name
	velocity.y = 0

func _state_input(_event: InputEvent) -> void:
	if _event.is_action_pressed("sprint") and stamina > stats.minimum_stamina_to_sprint:
		finished.emit("sprint")
	if _event.is_action_pressed("aim"):
		finished.emit("aim_run")

func _update(_delta: float) -> void:
	set_direction()
	calculate_velocity(stats.speed, direction, _delta)
	
	if stamina <= stats.max_stamina:
		stamina += _delta / stats.run_stamina_regen_modifier
	
	if !is_on_floor():
		finished.emit("airborne")
	if direction == Vector3.ZERO:
		finished.emit("idle")
