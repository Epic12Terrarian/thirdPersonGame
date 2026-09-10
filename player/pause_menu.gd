extends Node2D

@onready var the_pause_menu = $"."
@onready var button_resume = $resume_Button
@onready var motion_vars = $"../motionVarAccess"
@onready var toggle_sprint_button = $toggle_sprint
@onready var toggle_aim_button = $toggle_aim
@onready var quit_button = $quit
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
	the_pause_menu.visible = true

func unpause() -> void:
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
