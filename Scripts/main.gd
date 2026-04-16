extends Node2D

@onready var cam = $Camera2D
@onready var player1 = $Player1
@onready var player2 = $Player2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func player_defeated() -> void:
	get_node("Audio/Ko_sfx").play()
	get_node("CanvasLayer/Ko_effect").show()
	await get_tree().create_timer(2.0).timeout
	if player1.is_koed == true:
		get_node("Audio/P2win_sfx").play()
	else:
		get_node("Audio/P1win_sfx").play()
	get_node("CanvasLayer/Ko_effect").hide()
	get_node("CanvasLayer/GameUI/Restart_text").show()
	await get_tree().create_timer(5.0).timeout
	get_tree().reload_current_scene()
