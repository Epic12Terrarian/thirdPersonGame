extends Node2D

@onready var crosshair = $"../crosshairTemp"
@onready var camera_stuff = $"../../camera"
@onready var the_pause_menu = $"."
@onready var button_resume = $resume_Button
@onready var motion_vars = $"../motionVarAccess"
@onready var toggle_sprint_button = $toggle_sprint
@onready var toggle_aim_button = $toggle_aim
@onready var model_swap_button = $model_swap
@onready var quit_button = $quit
@onready var state_machine = $"../../StateMachines"
var firstTimePressed = true

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		if firstTimePressed:
			pause()
			firstTimePressed = false
		else:
			firstTimePressed = true
			unpause()

func pause() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_tree().paused = true
	toggle_sprint_button.text = "TOGGLE_SPRINT: " + str(motion_vars.toggle_sprint)
	toggle_aim_button.text = "TOGGLE_AIM: " + str(motion_vars.toggle_aim)
	model_swap_button.text = "MODEL: " + camera_stuff.player_char
	the_pause_menu.visible = true

func unpause() -> void:
	if motion_vars.last_state == "sprint":
		match motion_vars.toggle_sprint:
			false:
				camera_stuff.exit_sprint()
				state_machine._change_state("run")
	if motion_vars.last_state == "aim_idle":
		match motion_vars.toggle_aim:
			false:
				camera_stuff.exit_aim()
				crosshair.visible = false
				state_machine._change_state("idle")
	if motion_vars.last_state == "aim_run":
		match motion_vars.toggle_aim:
			false:
				camera_stuff.exit_aim()
				crosshair.visible = false
				state_machine._change_state("run")
	get_tree().paused = false
	the_pause_menu.visible = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func toggle_sprint() -> void:
	toggle_sprint_button.text = "TOGGLE_SPRINT: " + str(motion_vars.toggle_sprint)
	match motion_vars.toggle_sprint:
		true:
			motion_vars.toggle_sprint = false
		false:
			motion_vars.toggle_sprint = true
	toggle_sprint_button.text = "TOGGLE_SPRINT: " + str(motion_vars.toggle_sprint)

func toggle_aim() -> void:
	toggle_aim_button.text = "TOGGLE_AIM: " + str(motion_vars.toggle_aim)
	match motion_vars.toggle_aim:
		true:
			motion_vars.toggle_aim = false
		false:
			motion_vars.toggle_aim = true
	toggle_aim_button.text = "TOGGLE_AIM: " + str(motion_vars.toggle_aim)

func quit() -> void:
	get_tree().quit()

func model_swap() -> void:
	camera_stuff.model_swap()
	model_swap_button.text = "MODEL: " + camera_stuff.player_char
