class_name Player2GroundDashState
extends Player2State

var dash_complete
var dash_direction

const DASH_SPEED: float = 1200
const DECELERATION: float = 150

func enter() -> void:
	super()
	dash_complete = false
	dash_direction = get_move_dir()
	print("\nP2 Dash State")
	if dash_direction == 0:
		if(player.sprite_flipped == true):
			dash_direction = -1.0
		else:
			dash_direction = 1.0
	player.velocity.x = dash_direction * DASH_SPEED
	player.animation.play(grounddash_anim)
	player.animation.animation_finished.connect(func(_anim): dash_complete = true)

func exit(new_state: State = null) -> void:
	player.velocity.x = 0
	super(new_state)
	pass
	
func process_input(event: InputEvent) -> State:
	super(event)
	if event.is_action_pressed(jump_key):
		return jump_state
	elif event.is_action_pressed(dash_key):
		return grounddash_state
	return null

func process_physics(delta: float) -> State:
	super.process_physics(delta)
	#player.velocity.x -= DECELERATION * delta
	return null
	
func process_frame(delta: float) -> State:
	#print("After enter enabled:", hitbox_area.monitoring)
	super(delta)
	if dash_complete: 
		print("dash complete")
		if(get_move_dir() != 0):
			return walk_state
		return idle_state
	return null
	
func get_move_dir() -> float:
	# print("Input axis = ", Input.get_axis(left_key, right_key))
	return Input.get_axis(left_key, right_key)
