extends Control

onready var draw_space = get_node("%draw space")
onready var letter_holder = $letter_holder


func _ready():
	randomize()
	var i:int = rand_range(0,25)
	letter_holder.texture = LetterMapping.letters[i]
	


func _notification(what):
	if what == NOTIFICATION_WM_GO_BACK_REQUEST:
		SceanTransition.change_scene("res://scene\'s/menu/level_selector_screen/level_selector.tscn")


func _on_delet_pressed():
	draw_space._clear_all()
