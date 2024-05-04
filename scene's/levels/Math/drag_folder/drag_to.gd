extends TextureRect
class_name Drag_to

var can_drop:bool
var nbr

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
	data.animation = false
	data.is_draging = false
	data.set_global_position( get_global_rect().position )
	data.mouse_filter = MOUSE_FILTER_STOP
	print("i have :",data)
