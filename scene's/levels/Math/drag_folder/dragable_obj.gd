extends TextureButton
class_name Dragable_obj


var acceleration = .5
var is_draging:bool
var init_position:Vector2
var animation:bool = false;
var can_drop
var nbr=0
func _ready():
	
	init_position = rect_position



func get_drag_data(_position:Vector2):
	is_draging = true
	
	return self

func _input(event):
	if event is InputEventScreenTouch:
		var touch = event as InputEventScreenTouch
		if not touch.pressed && is_draging:
			is_draging = false
			animation = true
			mouse_filter = MOUSE_FILTER_STOP


func _process(_delta:float):
	if is_draging:
		mouse_filter = MOUSE_FILTER_IGNORE
		set_global_position( lerp(get_global_rect().position , get_global_mouse_position() - rect_size/2  , acceleration ))

	elif animation:
		mouse_filter = MOUSE_FILTER_STOP
		rect_position = (lerp(rect_position  , init_position, acceleration))
		if Vector2(rect_position).is_equal_approx(init_position):
			animation = false



