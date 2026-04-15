class_name PlayerWalkState
extends PlayerState

const SPEED: float = 300

func enter() -> void:
	super()
	print("Walk State")
	player.animation.play(walk_anim)

func exit(new_state: State = null) -> void:
	super(new_state)
	player.velocity.x = 0.0
	pass
	
func process_input(event: InputEvent) -> State:
	print("walk input")
	super(event)
	if event.is_action_pressed(jump_key):
		return jump_state
	elif event.is_action_pressed(light_key):
		#print("light pressed in walk")
		return standlight_state
	elif event.is_action_pressed(heavy_key):
		return standheavy_state
	elif event.is_action_pressed(dash_key):
		return grounddash_state
	return null

func process_physics(delta: float) -> State:
	player.update_facing()
	print("move_dir = ", get_move_dir())
	super.process_physics(delta)
	if get_move_dir().x == 0.0: 
		return idle_state
	do_move(get_move_dir().x)

	return null
	
func get_move_dir() -> Vector2:
	var x_dir = Input.get_axis(left_key, right_key)
	#print("Input axis x = ", Input.get_axis(left_key, right_key))
	var y_dir = Input.get_axis(jump_key, down_key)
	#print("Input axis y = ", Input.get_axis(left_key, right_key))
	return Vector2(x_dir, y_dir)

func do_move(move_dir: float) -> void:
	player.velocity.x = move_dir * SPEED
