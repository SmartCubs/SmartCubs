extends Control


onready var animation_player = $AnimationPlayer
onready var color_rect = $panel/playTransition
onready var option_panel = $panel/optionMenu
onready var btnCloseOption = option_panel.get_node("Button")

func _ready():
	option_panel.visible = false
	color_rect.visible = false
	btnCloseOption.connect("button_up",self,"_on_close_btn_click")
	

func _on_close_btn_click():
	animation_player.play_backwards("option")

#play btn event
func _on_playBTN_button_up():
	$playBTN.rect_scale = Vector2(1,1)
	color_rect.visible = true
	animation_player.play("start")
	

func _on_playBTN_button_down():
	$playBTN.rect_scale = lerp(Vector2(1,1) ,Vector2(0.9,0.9),0.25)

func Start_level():
	get_tree().change_scene("res://scene\'s/levels/letter/level1.tscn")

#option btn event
	#change to parameter scene
func _on_Button_button_up():
	option_panel.visible = true
	animation_player.play("option")
	
