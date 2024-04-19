extends Control


#TODO: make the logic for the level selector

const levels = ['level1','level2','level3']
#when using curent level always us it with absolute value cauz it can get negatives values
var curent_level = 0;

#TODO: make some desgin for the level selector 

#variables
var acceleration = .5
var itsIn = false
var is_dragging = false
var changing_level = false
var its_animation = false

var clicked_position:Vector2
var go_to = 0.0

onready var init_position:Vector2 =Vector2.ZERO
onready var level = $Button/level
onready var right_position = $right_position.position
onready var left_position = $left_position.position

#functions 
	##function to detect screen drag
func _screen_drag(mouse_position:Vector2) -> bool:
	if abs(mouse_position.x - get_global_mouse_position().x) > 50:
		return true
	return false

func _ready():
	init_position = level.rect_position
	$right_position.position.x = get_viewport_rect().size.x + 120
	right_position = $right_position.position

func _input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			is_dragging = true
			clicked_position = get_global_mouse_position()
		else:
			is_dragging = false
	if is_dragging && _screen_drag(clicked_position) && itsIn == true  :
		acceleration = .5
		level.rect_position.x = lerp(level.rect_position.x, event.position.x - level.rect_size.x/2 ,acceleration )


func _process(_delta):
	if init_position != level.rect_position && is_dragging == false && its_animation == false:
		level.rect_position.x = lerp(level.rect_position,init_position,acceleration).x
		if( abs(level.rect_position.x - init_position.x) <.5 ):
			level.rect_position.x = init_position.x
	#TODO: make the animation for swap left and right
	#animation left	#animation right
	if its_animation == true:
		level.rect_position.x = lerp(level.rect_position.x,go_to,acceleration)
		yield(get_tree().create_timer(.2), "timeout")
		if go_to == left_position.x:
			level.rect_position.x = right_position.x
			its_animation = false
		elif go_to == right_position.x:
			level.rect_position.x = left_position.x
			its_animation = false
	##line 2d test
	$Button/level/Line2D.points[0] = level.rect_position





#we  know if its clicking for playing or changing level
## when we  compar the original position of the btn and its last position
func _on_level_pressed():
	acceleration = .25
	var drag_distance = init_position.x - level.rect_position.x
	if abs(drag_distance) < 50:
		print("clicked")
		_level_selector()
	elif drag_distance < 0:
		_go_right()
	else:
		_go_left()

########################logic for waping #####################################
####left
func _go_left():
	curent_level = (curent_level+1) % 3
	print("left: curent level: ",abs(curent_level))
	go_to = left_position.x
	its_animation = true
######right
func _go_right():
	curent_level = (curent_level-1) % 3
	print("right: curent level: ",abs(curent_level))
	go_to = right_position.x
	its_animation = true

#################logic for navigation btn ##############################
####right 
func _on_go_right_btn_pressed():
	_go_right()

####left
func _on_go_left_btn_pressed():
	_go_left()



#TODO: ajouter la fonction pour choisir du niveux (changer l'image, le lien du button ... )
func _level_selector():
	match int(abs(curent_level)):
		0:
			SceanTransition.change_scene("res://scene\'s/levels/letter/level1.tscn","d")
			SceanTransition.audio_pause()
		1:
			pass
		2:
			pass


func _on_level_button_down():
	itsIn = true



func _on_level_button_up():
	itsIn = false



func _on_level_selector_resized():
	if level != null:
		var viewport_size = get_viewport_rect().size
		# Calculate center position
		var center_position = (viewport_size - level.rect_size) / 2
		# Set THE position
		init_position = center_position
		print(init_position)
	$right_position.position.x = get_viewport_rect().size.x + 120
	right_position = $right_position.position


