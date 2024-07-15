extends TextureRect
class_name drag_to

var is_empty:bool = true
var old_obj:drag_object
var queue = []

export var test:int

func _swap(obj:drag_object):
	if queue.empty():
		obj.rect_position = self.rect_position
		obj.drag = false
		#obj.station_position = rect_position
		queue.append(obj)
		old_obj = obj
		
	else:
		queue.pop_back()
		queue.append(obj)
		obj.rect_position = self.rect_position
		obj.drag = false
		old_obj.rect_position = old_obj.init_position
		old_obj = obj


var y = true




func _on_Area2D_area_entered(area):
	if area.get_parent() is drag_object:
		_swap(area.get_parent())




func _on_Area2D_area_exited(area):
	if area.get_parent() is drag_object and area.get_parent().drag == true:
		queue.pop_back()
