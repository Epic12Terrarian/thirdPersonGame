extends CharacterBody3D


const SPEED = 3
const JUMP_VELOCITY = 4.5
const GRAV_MULTIPLIER = 3.5

func set_velocity_from_motion(vel: Vector3) -> void:
	velocity = vel

func _physics_process(_delta: float) -> void:
	
	## Add the gravity.
	#if not is_on_floor():
	#	velocity += get_gravity() * GRAV_MULTIPLIER * delta

	## Handle jump.
	##if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	##	velocity.y = JUMP_VELOCITY

	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#if is_on_floor():
	#	var input_dir := Input.get_vector("left", "right", "up", "down")
	#	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	#	if direction:
	#		velocity.x = direction.x * SPEED
	#		velocity.z = direction.z * SPEED
	#	else:
	#		velocity.x = move_toward(velocity.x, 0, SPEED)
	#		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
