extends Control


onready var animation_player = $AnimationPlayer
onready var option_panel = $optionMenu
onready var btnCloseOption = option_panel.get_node("Button")
onready var playBtn = $Button/playBTN
onready var light = $Button/playBTN/Light2D

func _ready() -> void:
	option_panel.visible = false
	btnCloseOption.connect("button_up",self,"_on_close_btn_click")
	#play idel animation after the load of the page
	animation_player.play("Idel")
	



func _notification(what):
	if what == NOTIFICATION_WM_GO_BACK_REQUEST:
		
		get_tree().quit()


#play btn {:



#########event button up for changing the scean##############
func _on_playBTN_button_up() -> void:
	playBtn.rect_scale = Vector2(1,1)
	SceanTransition.change_scene("res://scene\'s/menu/level_selector_screen/level_selector.tscn","r")
	animation_player.stop(true)


########event button down for playing a litel animation ############
func _on_playBTN_button_down():
	playBtn.rect_scale = lerp(Vector2(1,1) ,Vector2(0.9,0.9),0.25)

#}



#option btn event
##########change to parameter scene####################
func _on_Button_button_up() -> void:
	option_panel.visible = true
	animation_player.play("option")
	SceanTransition.audio_pause()
##########change to main menu sceane (exit option) ##############
func _on_close_btn_click() ->void:
	animation_player.play_backwards("option")
	yield($AnimationPlayer,"animation_finished")
	animation_player.play("Idel")
	SceanTransition.audio_pause(false)





