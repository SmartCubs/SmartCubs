extends Control

onready var cat = $panel/character2
onready var dog = $panel/character
onready var score = $label

export  var btnPath = "res://scene\'s/levels/letter/level1.tscn"
const main_scean = "res://scene\'s/menu/level_selector_screen/level_selector.tscn"

func _show(pose:int , text:String):
	visible = true
	cat.curent_pos = pose
	dog.curent_pos = pose
	score.text = text

func _on_exit_pressed():
	SceanTransition.change_scene(btnPath,"d")



func _on_go_to_selection_menu_pressed():
	SceanTransition.change_scene(main_scean)
