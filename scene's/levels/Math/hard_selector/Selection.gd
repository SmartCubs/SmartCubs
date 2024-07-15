extends TextureRect
var condition=[true,false,false]
# Declare member variables here. Examples:
# var a = 2
# var b = "text"





# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_btn_Confirm_pressed():
	if  condition[1]==false and condition[2]==false and condition[0]==false:
		condition[0]=true
	SceanTransition.change_scene("res://scene\'s/levels/Math/Board_calc.tscn","d",condition)
	pass # Replace with function body.


func _on_addition_pressed():
	if $GridContainer/addition/greenlit.visible==false:
		$GridContainer/addition/greenlit.visible=true
		condition[0]=true
	elif $GridContainer/addition/greenlit.visible==true:
		$GridContainer/addition/greenlit.visible=false
		condition[0]=false
	pass # Replace with function body.


func _on_minus_pressed():
	if $GridContainer/minus/greenlit.visible==false:
		$GridContainer/minus/greenlit.visible=true
		condition[1]=true
	else:
		$GridContainer/minus/greenlit.visible=false
		condition[1]=false
	pass # Replace with function body.


func _on_multiplication_pressed():
	if $GridContainer/multiplication/greenlit.visible==false:
		$GridContainer/multiplication/greenlit.visible=true
		condition[2]=true		
	else:
		$GridContainer/multiplication/greenlit.visible=false
		condition[2]=false
	pass # Replace with function body.
 # Replace with function body.
