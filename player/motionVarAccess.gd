extends Motion

@onready var sprint_tag = $"../SprintLabel"
@onready var current_state = $"../current_state"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	sprint_tag.text = "Sprint: " + str(stamina).pad_decimals(1)
	current_state.text = "Current State: " + last_state
