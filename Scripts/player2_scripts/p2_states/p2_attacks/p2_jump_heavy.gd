class_name Player2JumpHeavyState
extends Player2State

var attack_complete

@onready var hitbox_area: P2Hitbox = $"jH_HitboxArea"
@onready var hitbox_collision: CollisionShape2D = $"jH_HitboxArea/jH_hitbox"

func enter() -> void:
	#print("Before enter disabled:", hitbox_area.monitoring)
	hitbox_collision.set_deferred("disabled", true)
	hitbox_area.monitoring = true
	hitbox_area.monitorable = true
	
	attack_complete = false
	print("\nP2 Jump Heavy Attack state")
	
	if player.sprite_flipped == true: 
		hitbox_collision.position.x *= -1
		print("hitbox flipped")
	
	player.animation.play(jumpheavy_anim)
	player.animation.animation_finished.connect(func(_anim): attack_complete = true)
	
func exit(new_state: State = null) -> void:
	hitbox_collision.set_deferred("disabled", true)
	hitbox_area.monitoring = false
	hitbox_area.monitorable = false
	#print("After exit disabled:", hitbox_area.monitoring)
	hitbox_collision.position.x = abs(hitbox_collision.position.x)

	attack_complete = true
	super(new_state)
	pass

func process_input(event: InputEvent) -> State:
	super(event)
	return null

func process_physics(delta: float) -> State:
	if(player.is_on_floor()):
		player.velocity.x = 0
		if get_move_dir() != 0.0:
			return walk_state
		else: 
			return idle_state
	player.velocity.y += gravity * delta
	player.move_and_slide()
	return null
	
func process_frame(delta: float) -> State:
	#print("After enter enabled:", hitbox_area.monitoring)
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
