class_name PlayerState
extends State

@onready var player: CharacterBody2D = get_parent().get_parent()

var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity",980)

# Animation names
var idle_anim: String = "Idle"
var walk_anim: String = "Walk"
var jump_anim: String = "Jump"
var fall_anim: String = "Fall"
var standlight_anim: String = "StandLight"
var jumplight_anim: String = "JumpLight"
var standheavy_anim: String = "P1_StandHeavy"
var jumpheavy_anim: String = "P1_JumpHeavy"
var hitstun_anim: String = "Hitstun"
var defeat_anim: String = "Defeat"
var grounddash_anim: String = "P1_GroundDash"

# States (ADD AS EXTERnAL VARIABLES AND LINK IN EDITOR)
@export_group("States")
@export var idle_state: PlayerState
@export var walk_state: PlayerState
@export var jump_state: PlayerState
@export var fall_state: PlayerState
@export var standlight_state: PlayerState
@export var jumplight_state: PlayerState
@export var standheavy_state: PlayerState
@export var jumpheavy_state: PlayerState
@export var hitstun_state: PlayerState
@export var defeat_state: PlayerState
@export var grounddash_state: PlayerState

# Input keys MAKE SURE THEY MATCH 
var movement_key: String = "Movement"
var left_key: String = "player1_left"
var right_key: String = "player1_right"
var down_key: String = "player1_down"
var jump_key: String = "player1_up"
var light_key: String = "player1_light"
var heavy_key: String = "player1_heavy"
var dash_key: String = "player1_dash"

func process_physics(delta: float) -> State:
	player.velocity.y += gravity * delta
	player.move_and_slide()
	#print("player.is_on_floor() =", player.is_on_floor())
	if(player.velocity.y >= 0 and not player.is_on_floor()):
		return fall_state
	return null

func exit(new_state: State = null) -> void:
	super()
