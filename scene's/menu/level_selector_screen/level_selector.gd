extends Control



########preload variables##################
const alphabet_lvl = preload("res://asset\'s/level_selector/alphabet_level.png")
const number_lvl = preload("res://asset\'s/level_selector/number_level.png")
const drawing_lvl = preload("res://asset\'s/level_selector/drawing_level.png")


#TODO: make the logic for the level selector

const levels = {
	'level1': "res://scene\'s/levels/letter/level1.tscn",
	'level2': "res://scene\'s/levels/Math/hard_selector/Hard_selector.tscn",
	'level3': "res://scene\'s/levels/drawing_world/drawing_world.tscn"
}
#when using curent level always us it with absolute value cauz it can get negatives values
var curent_level = 0;

#TODO: make some desgin for the level selector 


#variables
var acceleration = .1
var itsIn = false
var is_dragging = false
var its_animation = false
var clicked_position:Vector2
var go_to:float = 0



####onready var
onready var init_position:Vector2 =Vector2.ZERO
onready var level = $"%level"
onready var right_position = $right_position.position
onready var left_position = $left_position.position





#functions 
	##function to detect screen drag
func _screen_drag(mouse_position:Vector2) -> bool:
	if abs(mouse_position.x - get_global_mouse_position().x) > 50:
		return true
	return false






func _notification(what):
	if what == NOTIFICATION_WM_GO_BACK_REQUEST:
		SceanTransition.change_scene("res://scene's/menu/mainMenu.tscn")



func _ready():
	_change_images()
	
	init_position = level.rect_position
	$right_position.position.x = get_viewport_rect().size.x + 120
	right_position = $right_position.position
	
	
##################################testing text to speach#########################
#	var text = "Text to speech is a really neat thing."
#	var speed = 0.9
#	yield($TextToSpeech.say("test", TextToSpeechEngine.VOICE_AWB, speed), "completed")
#	yield($TextToSpeech.say("you", TextToSpeechEngine.VOICE_AHW, speed), "completed")
#	yield($TextToSpeech.say("ahhhhhhhhh", TextToSpeechEngine.VOICE_FEM, speed), "completed")
#	yield($TextToSpeech.say(text, TextToSpeechEngine.VOICE_AEW, speed), "completed")
#	yield($TextToSpeech.say(text, TextToSpeechEngine.VOICE_SLT, speed), "completed")
#	yield($TextToSpeech.say(text, TextToSpeechEngine.VOICE_EEY, speed), "completed")
#	yield($TextToSpeech.say(text, TextToSpeechEngine.VOICE_CLB, speed), "completed")



func _input(event)->void:
	if event is InputEventScreenTouch:
		if event.is_pressed():
			clicked_position = get_global_mouse_position()
		else:
			is_dragging = false
	if is_dragging && _screen_drag(clicked_position) && itsIn == true  :
		acceleration = .5
		level.rect_position.x = lerp(level.rect_position.x, event.position.x - level.rect_size.x/2 ,acceleration )




func _process(_delta)->void:
	if init_position != level.rect_position && is_dragging == false && its_animation == false:
		level.rect_position.x =  lerp(level.rect_position,init_position,acceleration).x
		if( abs(level.rect_position.x - init_position.x) <.5 ):
			level.rect_position.x = init_position.x
			

	#TODO: make the animation for swap left and right
	#animation left	#animation right
	
	if its_animation == true:
		level.rect_position.x = lerp(level.rect_position.x,go_to,acceleration)
		yield(get_tree().create_timer(.3), "timeout")

		if is_equal_approx(go_to , left_position.x):
			level.rect_position.x = right_position.x
			its_animation = false
		elif is_equal_approx(go_to ,right_position.x):
			level.rect_position.x = left_position.x
			its_animation = false







#we  know if its clicking for playing or changing level
## when we  compar the original position of the btn and its last position
func _on_level_pressed()->void:
	acceleration = .1
	var drag_distance = init_position.x - level.rect_position.x
	if abs(drag_distance) < 50:
		print("clicked")
		_level_selector()
	elif drag_distance < 0:
		_go_right()
	else:
		_go_left()

########################logic for swaping #####################################
####left
func _go_left()->void:
	curent_level = (curent_level+1) % 3
	_change_images()
	print("left: curent level: ",abs(curent_level))
	go_to = left_position.x

	its_animation = true
######right
func _go_right():
	curent_level = (curent_level-1) % 3
	_change_images()
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

########################changer limage du level selector#############################
func _change_images()->void:
	match int(abs(curent_level)):
		0:
			level._set_img(alphabet_lvl)
		1:
			level._set_img(number_lvl)
		2:
			level._set_img(drawing_lvl)

#########################matching each btn with its path ###########################
func _level_selector()->void:
	match int(abs(curent_level)):
		0:
			SceanTransition.change_scene(levels["level1"],"d")
		1:
			SceanTransition.change_scene(levels["level2"],"d")
		2:
			SceanTransition.change_scene(levels["level3"],"d")


func _on_level_button_down():
	is_dragging = true
	itsIn = true



func _on_level_button_up():
	is_dragging = false
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
