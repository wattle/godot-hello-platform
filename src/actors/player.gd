extends actor

# velocity.y = max(velocity.y, speed.y)

func _physics_process(delta):
	var direction := get_direction()
	_velocity = calculate_move_velocity(_velocity, direction, speed)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)

func get_direction() -> Vector2:
	var right = Input.get_action_strength("move_right")
	var left = Input.get_action_strength("move_left")
	var vertical = 1.0
	if Input.is_action_just_pressed("jump") and is_on_floor(): 
		vertical = -1.0
		
	return Vector2(
		right - left, 
		vertical
	)
	
func calculate_move_velocity(linear_velocity: Vector2,
		direction: Vector2,
		speed: Vector2
	) -> Vector2: 
		var is_jump_interrupted := Input.is_action_just_released("jump") and linear_velocity.y < 0.0	
		var out := linear_velocity
		out.x = speed.x * direction.x
		out.y += gravity * get_physics_process_delta_time()
		
		if direction.y == -1.0:
			out.y = speed.y * direction.y
		if is_jump_interrupted: 
			out.y = 0.0
		return out
