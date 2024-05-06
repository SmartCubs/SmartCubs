extends Control
var wrong


var Condition
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
	if wrong!=0:
		visible = false

		
		
#
func _on_answers_result(result):
	wrong=result
	if wrong==0:
		$panel/pass.visible=true
		$panel/exit.visible=false
		$panel/Home.visible=true
	else:
		$panel/pass.visible=false
		$panel/exit.visible=true
		$panel/Home.visible=false
	pass # Replace with function body.


func _on_pass_pressed():
	if wrong==0:
		SceanTransition.change_scene(btnPath,"d",Condition)
		visible=false
		
	pass # Replace with function body.


func _on_Home_pressed():
	SceanTransition.change_scene("res://scene\'s/menu/mainMenu.tscn","d")
	pass # Replace with function body.


func _on_Equations_loc_Operator_get(rule):
	Condition=rule
	print("the terms: ",Condition)
	pass # Replace with function body.
