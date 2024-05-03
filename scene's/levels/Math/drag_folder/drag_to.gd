extends TextureRect
class_name Drag_to

var can_drop:bool


func can_drop_data(position, data) ->bool:
	if data is Dragable_obj:
		can_drop = true
	else:
		can_drop = false
	return can_drop

func drop_data(position, data):
#	data.is_draging = false
#	data.mouse_filter = Control.MOUSE_FILTER_IGNORE
#	TODO: if not work position wise in dragto change this
	data.rect_position =  rect_position - data.get_parent().rect_position

	data.is_draging = false
	data.mouse_filter = MOUSE_FILTER_STOP