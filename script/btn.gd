extends Control
class_name BTN


export (Vector2) var size_on_press = Vector2(0.8,.8)

func _ready():
	rect_pivot_offset = rect_size/2
	connect("button_down",self,"anime_down")
	connect("button_up",self,"anime_up")



func anime_down():
	rect_scale =  size_on_press
	
func anime_up():
	rect_scale = Vector2.ONE 
