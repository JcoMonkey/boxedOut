class_name Camera
extends Camera2D

const INIT_ZOOM: Vector2 = Vector2.ZERO
const INIT_OFFSET: Vector2 = Vector2.ZERO

var cur_zoom: Vector2 = INIT_ZOOM
var cur_offset: Vector2 = INIT_OFFSET

var shake_recov_fac: float = 1
var zoom_recov_fac: float = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	
	#fix this to have a value
	zoom = INIT_ZOOM
	offset = INIT_OFFSET
	
	print("Camera current: ", is_current())
	print("Camera position: ", global_position)
	print("Screen center: ", get_screen_center_position())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func recover_zoom(delta: float) -> void:
	cur_zoom = lerp(cur_zoom, INIT_ZOOM, delta * zoom_recov_fac)
	zoom = cur_zoom
	
func set_zoom_str(zoom_str: float) -> void:
	cur_zoom *= zoom_str
