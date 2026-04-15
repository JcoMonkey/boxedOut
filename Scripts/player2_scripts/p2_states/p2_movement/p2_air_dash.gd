class_name Player2AirDashState
extends Player2State

const AIRDASH_SPEED: float = 666

var dash_complete
var dash_direction

func enter() -> void:
	super()
	dash_complete = false
	player.used_airdash = true
	print("Airdash state")
	dash_direction = get_move_dir()
	print(dash_direction)
		
	# check for no direction
	if(dash_direction == Vector2(0,0)):
		if player.sprite_flipped == true :
			dash_direction = Vector2(-1,0)
		else:
			dash_direction = Vector2(1,0)
	do_move(dash_direction)
	player.animation.play(airdash_anim)
	player.animation.animation_finished.connect(func(_anim): dash_complete = true)

func exit(new_state: State = null) -> void:
	#check for ground
	super()
	pass

func process_input(event: InputEvent) -> State:
	if event.is_action_pressed(light_key):
		return jumplight_state
	if event.is_action_pressed(heavy_key):
		return jumpheavy_state
	return null

func process_physics(delta: float) -> State:
	# do_move(get_move_dir())
	if(player.is_on_floor()):
		player.velocity.x = 0
		if get_move_dir().x != 0.0:
			return walk_state
		else: 
			return idle_state
	player.move_and_slide()
	return null
	
func process_frame(delta: float) -> State:
	#print("After enter enabled:", hitbox_area.monitoring)
	super(delta)
	if dash_complete: 
		print("airdash complete")
		if not player.is_on_floor():
			return fall_state
		elif(get_move_dir().y == -1):
			# player never technically "lands" so explicitly returns airdash use
			player.used_airdash = false
			return jump_state
		elif(dash_direction.x != 0):
			return walk_state
		return idle_state
	return null

func get_move_dir() -> Vector2:
	var x_dir = Input.get_axis(left_key, right_key)
	#print("Input axis x = ", Input.get_axis(left_key, right_key))
	var y_dir = Input.get_axis(jump_key, down_key)
	#print("Input axis y = ", Input.get_axis(left_key, right_key))

	return Vector2(x_dir, y_dir)

func do_move(move_dir: Vector2) -> void:
	player.velocity = move_dir * AIRDASH_SPEED
