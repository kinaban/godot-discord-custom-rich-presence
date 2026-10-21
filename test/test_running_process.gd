extends Node


func _ready() -> void:
	var start := Time.get_ticks_msec()
	var list := RunningProcess.get_path_list()
	var elapsed := Time.get_ticks_msec() - start
	
	prints("Elapsed:", elapsed)
	prints("Size:", list.size())
	
	for i in list.size():
		prints(i, list[i])
	
