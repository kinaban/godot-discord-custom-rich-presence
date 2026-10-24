extends PanelContainer

@onready var process_option: OptionButton = %ProcessOption


func _ready() -> void:
	refresh()


func _on_refresh_process_button_pressed() -> void:
	refresh()


func refresh() -> void:
	## This deletes the old process list.
	## Do not delete the first item.
	for i in range(process_option.item_count - 1, 0, -1):
		process_option.remove_item(i)
	
	var path_list := RunningProcess.get_path_list()
	
	for path in path_list:
		process_option.add_item("Process: " + path)
