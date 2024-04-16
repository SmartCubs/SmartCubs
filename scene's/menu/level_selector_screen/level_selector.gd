extends Control


#TODO: make the logic for the level selector

const levels = ['level1','level2','level3']

var curent_level = 0;

#TODO: make some desgin for the level selector 

#variables
const acceleration = .5
var itsIn = false
var is_dragging = false
var changing_level = false
var init_position:Vector2
var clicked_position:Vector2


onready var level = $level


#functions 
	##function to detect screen drag
func _screen_drag(mouse_position:Vector2) -> bool:
	if abs(mouse_position.x - get_global_mouse_position().x) > 50:
		return true
	return false

func _ready():
	init_position = level.rect_position

func _input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed() :
			is_dragging = true
			clicked_position = get_global_mouse_position()
		else:
			is_dragging = false
	if is_dragging && _screen_drag(clicked_position) && itsIn == true:
		level.rect_position.x = lerp(level.rect_position.x, event.position.x - level.rect_size.x/2 ,acceleration )


func _process(delta):
	if init_position != level.rect_position && is_dragging == false:
		level.rect_position.x = lerp(level.rect_position,init_position,acceleration).x
	





#FIXME: need to know when the player is cliking the button to play or to change level
#TODO: we can know if its for playing or changing level with comparing the original position of the btn and its last position
func _on_level_pressed():
	var drag_distance = init_position.x - level.rect_position.x
	if abs(drag_distance) < 4:
		print("clicked")
	elif drag_distance < -4:
		print("right")
	else:
		print("left")






func _on_level_button_down():
	itsIn = true


func _on_level_button_up():
	itsIn = false
