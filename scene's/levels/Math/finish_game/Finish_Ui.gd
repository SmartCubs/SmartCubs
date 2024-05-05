extends Control
var wrong



onready var cat = $panel/ribbon/character
onready var dog = $panel/ribbon/character2
onready var score = $label
export  var btnPath = "res://scene\'s/levels/Math/Board_calc.tscn"

func _show(pose:int , text:String):
	visible = true
	cat.curent_pos = pose
	dog.curent_pos = pose
	score.text = text

func _on_exit_pressed():
	
	visible = false
#
#
#func _on_answers_result(result):
#	wrong=result
#	pass # Replace with function body.
