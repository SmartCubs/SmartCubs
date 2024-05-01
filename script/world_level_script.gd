extends Control

onready var draw_space = get_node("%draw space")

func _on_delet_pressed():
	draw_space._clear_all()
