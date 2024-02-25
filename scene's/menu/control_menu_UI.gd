extends Control

onready var pause = $VBoxContainer/pause
onready var main_menu = $VBoxContainer/mainMenu




func _on_mainMenu_button_up():
	SceanTransition.change_scene("res://scene\'s/menu/mainMenu.tscn")
