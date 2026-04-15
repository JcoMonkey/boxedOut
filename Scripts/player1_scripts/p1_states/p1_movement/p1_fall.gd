class_name PlayerFallState
extends PlayerState

const AIR_SPEED: float = 260

func enter() -> void:
	super()
	print("Fall state")
	player.animation.play(fall_anim)

func exit(new_state: State = null) -> void:
	#check for ground
	super()
	pass

func process_input(event: InputEvent) -> State:
	if event.is_action_pressed(light_key):
		return jumplight_state
	if event.is_action_pressed(heavy_key):
		return jumpheavy_state
	if event.is_action_pressed(dash_key) and not player.used_airdash:
		return airdash_state
	return null

func process_physics(delta: float) -> State:
	# do_move(get_move_dir())
	if(player.is_on_floor()):
		player.velocity.x = 0
		if(get_move_dir().y == -1):
			# player never technically "lands" so explicitly returns airdash use
			player.used_airdash = false
			return jump_state
		elif get_move_dir().x != 0.0:
			return walk_state
		else: 
			return idle_state
	player.velocity.y += gravity * delta
	player.move_and_slide()
	return null

func get_move_dir() -> Vector2:
	var x_dir = Input.get_axis(left_key, right_key)
	#print("Input axis x = ", Input.get_axis(left_key, right_key))
	var y_dir = Input.get_axis(jump_key, down_key)
	#print("Input axis y = ", Input.get_axis(left_key, right_key))
	return Vector2(x_dir, y_dir)
