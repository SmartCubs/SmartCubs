extends Control


onready var animation_player = $AnimationPlayer
onready var option_panel = $panel/optionMenu
onready var btnCloseOption = option_panel.get_node("Button")
onready var playBtn = $Button/playBTN

func _ready():
	option_panel.visible = false
	btnCloseOption.connect("button_up",self,"_on_close_btn_click")
	

func _on_close_btn_click():
	animation_player.play_backwards("option")

#play btn event
func _on_playBTN_button_up():
	playBtn.rect_scale = Vector2(1,1)
	SceanTransition.change_scene("res://scene\'s/levels/letter/level1.tscn","up")

func _on_playBTN_button_down():
	playBtn.rect_scale = lerp(Vector2(1,1) ,Vector2(0.9,0.9),0.25)

#option btn event
	#change to parameter scene
func _on_Button_button_up():
	option_panel.visible = true
	animation_player.play("option")
	
