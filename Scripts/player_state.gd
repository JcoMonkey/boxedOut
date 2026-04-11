class_name PlayerState
extends State

@onready var player: Player = get_tree().get_first_node_in_group("Player")

var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity",980)

# Animation names
var idle_anim: String = "Idle"
var walk_anim: String = "Walk"
var jump_anim: String = "Jump"
var fall_anim: String = "Fall"
var standlight_anim: String = "StandLight"


# States (ADD AS EXTERnAL VARIABLES AND LINK IN EDITOR)
@export_group("States")
@export var idle_state: PlayerState
@export var walk_state: PlayerState
@export var jump_state: PlayerState
@export var fall_state: PlayerState
@export var standlight_state: PlayerState
@export var jumplight_state: PlayerState

# State variables
var sprite_flipped: bool = false

# Input keys MAKE SURE THEY MATCH 
var movement_key: String = "Movement"
var left_key: String = "player1_left"
var right_key: String = "player1_right"
var jump_key: String = "player1_up"
var light_key: String = "player1_light"

# need to track later player facing direction relative to opponent

# TODO later for crossing up
# use player.sprite.flip_h = sprite_flipped
func determine_sprite_flipped() -> void:
	
	pass

#ts kinda broken
func process_physics(delta: float) -> State:
	player.velocity.y += gravity * delta
	player.move_and_slide()
	#print("player.is_on_floor() =", player.is_on_floor())
	if(player.velocity.y >= 0 and not player.is_on_floor()):
		return fall_state
	return null

func exit(new_state: State = null) -> void:
	super()
	#new_state.sprite_flipped = sprite_flipped
