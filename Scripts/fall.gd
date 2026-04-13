class_name PlayerFallState
extends PlayerState

const AIR_SPEED: float = 330

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
	return null

func process_physics(delta: float) -> State:
	do_move(get_move_dir())
	if(player.is_on_floor()):
		if get_move_dir() != 0.0:
			return walk_state
		else: 
			return idle_state
	player.velocity.y += gravity * delta
	player.move_and_slide()
	return null

func get_move_dir() -> float:
	print("Input axis = ", Input.get_axis(left_key, right_key))
	return Input.get_axis(left_key, right_key)

func do_move(move_dir: float) -> void:
	player.velocity.x = move_dir * AIR_SPEED
