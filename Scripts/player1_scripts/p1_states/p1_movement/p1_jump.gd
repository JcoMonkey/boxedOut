class_name PlayerJumpState
extends PlayerState

const AIR_SPEED: float = 330
const JUMP_FORCE: float = -600

func enter() -> void:
	super()
	print("Jump state")
	player.animation.play(jump_anim)
	#wait
	player.velocity.y =JUMP_FORCE
	do_move(get_move_dir())
	
	
func exit(new_state: State = null) -> void:
	player.hurtbox.monitoring = true
	super(new_state)
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
	#print("player velocity y= ",player.velocity.y)
	#print("jumpstate physics ran")
	#change later to be fixed jump arc, maintain velocity from initial jump
	#do_move(get_move_dir())
	return super(delta)

func get_move_dir() -> float:
	#print("Input axis = ", Input.get_axis(left_key, right_key))
	return Input.get_axis(left_key, right_key)

func do_move(move_dir: float) -> void:
	player.velocity.x = move_dir * AIR_SPEED
