class_name Player1HurtBox
extends Hurtbox

@onready var hitstun_state: PlayerHitstunState = $"../State Machine/Hitstun"
@onready var state_machine: StateMachine = $"../State Machine"

var hitting_area: Node2D

func _ready():
	super()
	collision_layer = 2
	collision_mask = 4

func on_area_entered(hitbox: Hitbox) -> void:
	player.take_damage(hitbox.damage)
	print("Player 1 health = ",player.currentHealth)
	print("Damage dealt player")
	if hitbox == null: return
	super(hitbox)
	state_machine.change_state(hitstun_state)
