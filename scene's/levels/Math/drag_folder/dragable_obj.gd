extends TextureButton
class_name Dragable_obj


var acceleration = .5
var is_draging:bool
var init_position:Vector2
var animation:bool = false;
var can_drop

func _ready():
	
	init_position = rect_position



func get_drag_data(_position:Vector2):
	is_draging = true
	print("draging")
	
	return self


func _process(_delta:float):
	if is_draging:
		rect_position = lerp(rect_position , get_global_mouse_position() - rect_min_size/2 - get_parent().rect_position , acceleration )
		mouse_filter = MOUSE_FILTER_IGNORE
		if Input.is_action_just_released("LMB"):
			is_draging = false
			animation = true
			mouse_filter = MOUSE_FILTER_STOP
	elif animation:
		rect_position = lerp(rect_position , init_position, acceleration)
		if Vector2(rect_position).is_equal_approx(init_position):
			animation = false
