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
<<<<<<< HEAD
#    data.is_draging = false
#    data.mouse_filter = Control.MOUSE_FILTER_IGNORE
#    TODO: if not work position wise in dragto change this
	data.set_global_position( get_global_rect().position )
	nbr=data.nbr
=======
#	data.is_draging = false
#	data.mouse_filter = Control.MOUSE_FILTER_IGNORE
#	TODO: if not work position wise in dragto change this
	data.set_global_position( get_global_rect().position )

>>>>>>> ab9310fc02e153458b182537da626783339f0928
	data.is_draging = false
	data.mouse_filter = MOUSE_FILTER_STOP
