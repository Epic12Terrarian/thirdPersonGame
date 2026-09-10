extends State
class_name Motion

@onready var camera = $"../../camera"

signal velocity_updated(vel: Vector3)
signal animation_state_change(state: String)

const stats = preload("res://player/player_movement_stats.tres")

#const SPEED: float = 3.5
#const SPRINT_SPEED: float = 3.0
#const AIM_SPEED: float = 2.0
#const GRAVITY: float = -15
#const ACCELERATION: float = 1000
#const MAX_STAMINA: float = 5
#const IDLE_STAMINA_REGEN_MODIFIER = 1
#const RUN_STAMINA_REGEN_MODIFIER = 2

static var toggle_sprint : bool = stats.toggle_sprint_default
static var toggle_aim : bool = stats.toggle_aim_default
static var last_state : String = "hi"
static var last_velocity : Vector3 = Vector3.ZERO
static var last_direction : Vector3 = Vector3.ZERO

static var input_direction : Vector2 = Vector2.ZERO
static var direction : Vector3 = Vector3.ZERO
static var velocity : Vector3 = Vector3.ZERO
static var stamina : float = 0

func _ready() -> void:
	velocity_updated.connect(owner.set_velocity_from_motion)

func set_direction() -> void:
	input_direction = Input.get_vector("left","right","up","down")
	direction = (owner.global_transform.basis * Vector3(input_direction.x, 0.0, input_direction.y)).normalized()

func calculate_velocity(_speed: float, _direction: Vector3, delta: float) -> void:
	velocity.x = move_toward(velocity.x, _direction.x*_speed, stats.acceleration * delta)
	velocity.z = move_toward(velocity.z, _direction.z*_speed, stats.acceleration * delta)
	velocity_updated.emit(velocity)

func calculate_gravity(delta: float) -> void:
	if not owner.is_on_floor():
		velocity.y += stats.gravity * delta

func is_on_floor() -> bool:
	return owner.is_on_floor()
