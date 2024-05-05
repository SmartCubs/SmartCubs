extends Control




onready var cat = $TextureRect/TextureRect2/character2
onready var dog = $TextureRect/TextureRect2/character
onready var score = $TextureRect/score


func _show(pose:int , text:String):
	cat.curent_pos = pose
	dog.curent_pos = pose
	score = text
