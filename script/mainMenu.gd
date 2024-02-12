extends Control


onready var animation_player = $AnimationPlayer
onready var color_rect = $panel/playTransition


func _ready():
	pass # Replace with function body.



func _on_playBTN_button_up():
	color_rect.visible = true
	animation_player.play("start")


func Start_level():
	get_tree().change_scene("res://scene\'s/levels/letter/level1.tscn")

#change to parameter scene
func _on_Button_button_up():
	pass
