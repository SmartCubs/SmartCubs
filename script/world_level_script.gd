extends Control

onready var draw_space = get_node("%draw space")
onready var letter_holder = $letter_holder
onready var character = get_node("Control/character")
onready var timer_ui = $timer_UI
onready var score_ui = $scores/score
onready var hs = $scores/HS


var score:int = 0
var score_added:int =1
var letter_to_draw:int
var hight_score

func _ready():
	_select_letter()
	timer_ui._start_timer()
	score_ui.text = "score: "+String(score)
	hight_score = SaveManager._load()
	print(hight_score)
	if( hight_score != null):
		hs.text = "HS: "+str(hight_score)
		


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
	if !is_instance_valid(timer_ui):
		return
	if letter_drawed == letter_to_draw:
		character._set_pose(2)
		_select_letter()
		timer_ui._add_time(5)
		timer_ui._add_speed(.01)
		timer_ui.max_speed +=.01
		draw_space._clear_all()
		score_added += 2
		score += score_added
		
		score_ui.text = "score: "+String(score)
		yield(get_tree().create_timer(1),"timeout")
		character._set_pose(0)
		
	

##game over
func _on_timer_UI_time_out():
	draw_space.queue_free()
	if hight_score == null:
		hight_score = 0
	elif hight_score < score:
		SaveManager._save(score)
		$Finish_Ui._show(2, "NEW HIGHT SCORE GOOD JOB: "+ String(score) )
		$Finish_Ui.visible = true
	else:
		$Finish_Ui._show(1, "SCORE: "+ String(score) )
		$Finish_Ui.visible = true
	
