class_name Player2HurtBox
extends Hurtbox

@onready var hitstun_state: Player2HitstunState = $"../State Machine/Hitstun"
@onready var state_machine: StateMachine = $"../State Machine"

var hitting_area: Node2D

func on_area_entered(hitbox: Hitbox) -> void:
	print("Damage dealt player")
	if hitbox == null: return
	super(hitbox)
	hitting_area = hitbox.owner
	state_machine.change_state(hitstun_state)
