extends Resource
class_name MovementStats

@export var toggle_sprint_default: bool = false
@export var toggle_aim_default: bool = false

@export var gravity: float = -15
@export var acceleration: float = 100

@export var speed: float = 3.5
@export var sprint_speed: float = 3.0
@export var aim_speed: float = 2.0

@export var max_stamina: float = 4.0
@export var idle_stamina_regen_modifier: float = 1.25
@export var run_stamina_regen_modifier: float = 2.25
@export var minimum_stamina_to_sprint: float = 0.5
