extends Control




onready var cat = $panel/ribbon/character
onready var dog = $panel/ribbon/character2
onready var score = $panel/score


func _show(pose:int , text:String):
	cat.curent_pos = pose
	dog.curent_pos = pose
	score = text
