extends Node3D
class_name AeromorphModel

@export var animation_tree: AnimationTree

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func on_state_machine_state_changed(state: String) -> void:
	animation_tree["parameters/unarmed_movement/transition_request"] = state
