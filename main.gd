extends PanelContainer

@onready var process_option: OptionButton = %ProcessOption


func _on_process_option_pressed() -> void:
	var path_list := RunningProcess.get_path_list()
	
	for path in path_list:
		process_option.add_item(path)
		pass
	
	prints("Pressed")
