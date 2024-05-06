extends TextureRect
class_name Drag_to

var can_drop:bool
var nbr
var index
var data_nbr:Dragable_obj
var empty:bool=true
signal Verify_nbr
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
	empty=false
	nbr=data.nbr
	emit_signal("Verify_nbr",nbr,index)
	data_nbr=data
	data.set_global_position( get_global_rect().position )
	data.mouse_filter = MOUSE_FILTER_STOP



# Replace with function body.


func _on_Area2D_area_exited(area):
	if area.get_parent()==data_nbr and area.get_parent() is Dragable_obj:
		empty=true
		nbr=null
		emit_signal("Verify_nbr",nbr,index)
		data_nbr=null
		print("am out")
		
	pass # Replace with function body.
