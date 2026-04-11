extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Camera current: ", is_current())
	print("Camera position: ", global_position)
	print("Screen center: ", get_screen_center_position())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
