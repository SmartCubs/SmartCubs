extends TextureButton
class_name Dragable_obj

onready var trail = $Node/Trail

var acceleration = .7
var is_draging:bool
var init_position:Vector2
var animation:bool = false;
var old_position:Vector2

var can_drop
var nbr=-1
var index=-1


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



func _process(delta:float):
	
	if is_draging:
		
		old_position = get_global_rect().position
		mouse_filter = MOUSE_FILTER_IGNORE
		set_global_position( lerp(get_global_rect().position , get_global_mouse_position() - rect_size/2  , .9 ))

	elif animation:
		modulate.a = 0
		mouse_filter = MOUSE_FILTER_STOP
		rect_position = (lerp(rect_position  , init_position, acceleration))
		if rect_position.is_equal_approx(init_position):
			animation = false
			old_position = get_global_rect().position
			modulate.a = 1

	if !old_position.is_equal_approx(get_global_rect().position)  :
		
		modulate.a = 0
		old_position = get_global_rect().position

	else:
		modulate.a = 1
	


