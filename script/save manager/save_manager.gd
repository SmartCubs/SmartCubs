extends Node




func _save(data , path:String = "user://smart_cubs.data"):
	var file = File.new()
	file.open(path,File.WRITE)
	file.store_var(data)
	file.close()
	print("saving: ",data)


func _load(path:String = "user://smart_cubs.data"):
	var file = File.new()
	var data = null
	file.open(path,File.READ)
	data = file.get_var()
	print(data)
	file.close()
	return data
