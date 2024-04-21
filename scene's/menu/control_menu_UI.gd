extends Control

onready var btn1 = $VBoxContainer/btn1
onready var btn2 = $VBoxContainer/btn2

#########export variables
export(String,FILE,"*.tscn") var path_btn1:String = "res://scene\'s/menu/mainMenu.tscn"
export(String,FILE,"*.tscn") var path_btn2:String = "res://scene's/menu/level_selector_screen/level_selector.tscn"

export(StreamTexture) var icon_img_btn1:StreamTexture = preload("res://asset\'s/icons/pause.png")
export(StreamTexture) var icon_img_btn2:StreamTexture = preload("res://asset\'s/icons/house.png")


func _ready():
	btn1.icon = icon_img_btn1
	btn2.icon = icon_img_btn2

func _on_mainMenu_button_up():
	SceanTransition.change_scene(path_btn1)


func _on_pause_button_up():
	SceanTransition.change_scene(path_btn2)
