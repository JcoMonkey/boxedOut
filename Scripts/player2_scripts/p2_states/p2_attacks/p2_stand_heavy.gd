class_name Player2StandHeavyState
extends Player2State

var attack_complete
@onready var hitbox: CollisionShape2D = $"5H_HitboxArea/5H_hitbox"

func enter() -> void:
	attack_complete = false
	print("\nP2 Heavy Attack state")
	
	if player.sprite_flipped == true: 
		hitbox.position.x *= -1
		print("hitbox flipped")
		
	player.animation.play(standheavy_anim)
	player.animation.animation_finished.connect(func(_anim): attack_complete = true)
	
func exit(new_state: State = null) -> void:
	hitbox.set_deferred("disabled", true)
	hitbox.position.x = abs(hitbox.position.x)
	attack_complete = true
	super(new_state)
	pass

func process_input(event: InputEvent) -> State:
	super(event)
	return null

func process_physics(delta: float) -> State: 
	#print("5h delta = ",  delta)
	player.velocity.x = 0

	if hitbox.disabled == false:
		if player.sprite_flipped == false:
			player.velocity.x = 1750
		else:
			player.velocity.x = -1750
	
	super.process_physics(delta)
	return null
	
func process_frame(delta: float) -> State:
	super(delta)
	if attack_complete: 
		print("attack complete")
		if(get_move_dir().y == -1):
			return jump_state
		if get_move_dir().x != 0.0:
			return walk_state
		else: 
			return idle_state
	return null

func get_move_dir() -> Vector2:
	var x_dir = Input.get_axis(left_key, right_key)
	#print("Input axis x = ", Input.get_axis(left_key, right_key))
	var y_dir = Input.get_axis(jump_key, down_key)
	#print("Input axis y = ", Input.get_axis(left_key, right_key))
	return Vector2(x_dir, y_dir)
