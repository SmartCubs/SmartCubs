extends Control

onready var draw_space = get_node("%draw space")
onready var letter_holder = $letter_holder
onready var character = get_node("Control/character")
onready var timer_ui = $timer_UI


var letter_to_draw:int

func _ready():
	_select_letter()
	timer_ui._start_timer()


func _notification(what):
	if what == NOTIFICATION_WM_GO_BACK_REQUEST:
		SceanTransition.change_scene("res://scene\'s/menu/level_selector_screen/level_selector.tscn")


func _on_delet_pressed():
	draw_space._clear_all()


func _select_letter():
	randomize()
	letter_to_draw = int(rand_range(0,26))
	letter_holder.texture = LetterMapping.letters[letter_to_draw]

func _on_request_sender_verify(letter_drawed:int):
	print("to draw: ",letter_to_draw)
	if letter_drawed == letter_to_draw:
		character._set_pose(2)
		_select_letter()
		timer_ui._add_time(5)
		timer_ui._add_speed(.01)
		draw_space._clear_all()
		
		yield(get_tree().create_timer(1),"timeout")
		character._set_pose(0)
		
	

##game over
func _on_timer_UI_time_out():
	pass
