extends TextureRect
var condition=[false,false,false,false]
signal condition_set
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_btn_Confirm_pressed():
	print(condition)
	emit_signal("condition_set",condition)
	SceanTransition.change_scene("res://scene\'s/levels/Math/Board_calc.tscn","d")
	pass # Replace with function body.


func _on_addition_pressed():
	if $GridContainer/addition/greenlit.visible==false:
		$GridContainer/addition/greenlit.visible=true
		condition[0]=true
	else:
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


func _on_negative_pressed():
	if $GridContainer/negative/greenlit.visible==false:
		$GridContainer/negative/greenlit.visible=true
		condition[3]=true
	else:
		$GridContainer/negative/greenlit.visible=false
		condition[3]=false
	pass # Replace with function body.
