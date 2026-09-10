extends Motion

@onready var crosshair = $"../../UI/crosshairTemp"

func _enter() -> void:
	print(name)
	last_state = name
	velocity.y = 0
	camera.enter_aim()
	crosshair.visible = true

func _state_input(_event: InputEvent) -> void:
	if _event.is_action_released("aim"): #toggle aim false
		if !toggle_aim:
			if direction == Vector3.ZERO:
				finished.emit("idle")
				camera.exit_aim()
				crosshair.visible = false
			if direction != Vector3.ZERO:
				finished.emit("run")
				camera.exit_aim()
				crosshair.visible = false
	if _event.is_action_pressed("aim"): #toggle aim true
		if toggle_aim:
			if direction == Vector3.ZERO:
				finished.emit("idle")
				camera.exit_aim()
				crosshair.visible = false
			if direction != Vector3.ZERO:
				finished.emit("run")
				camera.exit_aim()
				crosshair.visible = false

func _update(_delta: float) -> void:
	set_direction()
	calculate_velocity(AIM_SPEED, direction, _delta)
	
	if stamina <= MAX_STAMINA:
		stamina += _delta / IDLE_STAMINA_REGEN_MODIFIER
	
	if !is_on_floor():
		finished.emit("airborne")
		camera.exit_aim()
		crosshair.visible = false
	if direction != Vector3.ZERO:
		finished.emit("aim_run")
