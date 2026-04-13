class_name PlayerJumpLightState
extends PlayerState

var attack_complete

func enter() -> void:
	attack_complete = false
	print("Jump Light Attack state")
	player.animation.play(standlight_anim)
	player.animation.animation_finished.connect(func(_anim): attack_complete = true)
	
func exit(new_state: State = null) -> void:
	super(new_state)
	pass

func process_input(event: InputEvent) -> State:
	super(event)
	return null

func process_physics(delta: float) -> State:
	if(player.is_on_floor()):
		if get_move_dir() != 0.0:
			return walk_state
		else: 
			return idle_state
	player.velocity.y += gravity * delta
	player.move_and_slide()
	return null
	
func process_frame(delta: float) -> State:
	super(delta)
	if attack_complete: 
		print("attack complete")
		if not player.is_on_floor():
			return fall_state
		return idle_state
	return null

func get_move_dir() -> float:
	print("Input axis = ", Input.get_axis(left_key, right_key))
	return Input.get_axis(left_key, right_key)
