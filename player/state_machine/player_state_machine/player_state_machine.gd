extends StateMachine

@export var player_movement_stats: MovementStats
@export var lynx_model: LynxModel
@export var aeromorph_model: AeromorphModel

func _ready() -> void:
	for child: Motion in get_children():
		child.animation_state_change.connect(lynx_model.on_state_machine_state_changed)
		child.animation_state_change.connect(aeromorph_model.on_state_machine_state_changed)
	
	return super._ready()
