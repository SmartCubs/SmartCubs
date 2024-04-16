extends Control

#TODO: make some desgin for the level selector 

#variables
var itsIn = false
var is_dragging = false
var changing_level = false
var init_position:Vector2


onready var level = $level

func _ready():
	init_position = level.rect_position

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() :
			is_dragging = true
		else:
			is_dragging = false
	if is_dragging:
		
		level.rect_position.x = lerp(level.rect_position.x, event.position.x - level.rect_size.x/2 ,.25 )


func _process(delta):
	if init_position != level.rect_position && is_dragging == false:
		level.rect_position.x = lerp(level.rect_position,init_position,.5).x
	
	



#FIXME: need to know when the player is cliking the button to play or to change level
#TODO: we can know if its for playing or changing level with comparing the original position of the btn and its last position
func _on_level_pressed():
	if !( (init_position.x - level.rect_position.x) < -4 or (init_position.x - level.rect_position.x) > 4 ):
		print("test")






func _on_left_border_area_entered(area):
	pass # Replace with function body.


func _on_right_border_area_entered(area):
	pass # Replace with function body.
