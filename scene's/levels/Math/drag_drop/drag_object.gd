extends TextureButton
class_name drag_object

var drag:bool = false
var init_position:Vector2
var station_position:Vector2


func _drage_object():
	if drag == true:
		rect_position = get_global_mouse_position() - self.rect_size/2




func _ready():
	init_position = rect_position
	station_position = init_position

func _process(_delta):
	_drage_object()





func _on_drag_object_pressed():
	drag= true
