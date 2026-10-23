extends Node

## Window is resized here in order to avoid the delay between resizing and centering.[br]
## For conflicting overrides, the most specific override takes precedence, ex pc < linux.[br]

## Vector2i(0, 0) is considered as ignored.
@export var pc_override: Vector2i


func _ready() -> void:
	if pc_override != Vector2i.ZERO:
		get_window().size = pc_override
	
	else:
		return
	
	## Centers the window
	var window_half_size := DisplayServer.window_get_size() / 2.0
	var screen_half_size := DisplayServer.screen_get_size() / 2.0
	var position := screen_half_size - window_half_size
	
	DisplayServer.window_set_position(position)
