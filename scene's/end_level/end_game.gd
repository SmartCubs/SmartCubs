extends Control

onready var cat = $panel/ribbon/character
onready var dog = $panel/ribbon/character2
onready var score = $label

export  var btnPath = "res://scene\'s/levels/letter/level1.tscn"

func _ready():
	visible = false

func _show(pose:int , text:String):
	visible = true
	cat.curent_pos = pose
	dog.curent_pos = pose
	score.text = text

func _on_exit_pressed():
	SceanTransition.change_scene(btnPath,"d")

