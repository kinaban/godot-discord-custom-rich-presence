class_name RunningProcess

extends RefCounted


static func _get_path_list_linux() -> Array:
	var path_list := []
	var proc_dir := DirAccess.open("/proc")
	
	proc_dir.list_dir_begin()
	
	while true:
		var pid := proc_dir.get_next()
		
		# End of directory has been reached.
		if pid.is_empty() : break
		
		var pid_path := "/proc/%s/exe" % pid
		var output := []
		var exit_code := OS.execute("readlink", ["-f", pid_path], output)
		
		if exit_code != 0 or output.is_empty() : continue
		
		var path := str(output[0]).strip_edges()
		
		if path.is_empty() : continue
		
		path_list.append(path)
	
	proc_dir.list_dir_end()
	return path_list
