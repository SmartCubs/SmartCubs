extends Control

onready var lines := $Node2D/lines
onready var viewport:Viewport = get_viewport()



export (int,20,100) var width = 20


var pressed = false
var curent_line: Line2D
var image:Image
var old_child
var changing_width = false
signal send_img

func _ready():
	old_child = lines.get_point_count()
	lines.width = width


func _input(event: InputEvent) -> void:
	if  event is InputEventMouseButton :
		pressed = event.pressed
		
		# Making line
		if pressed:
			curent_line = Line2D.new()
			curent_line.default_color = lines.default_color
			curent_line.width = lines.width
			lines.add_child(curent_line)
		if not event.is_pressed() :
			emit_signal("send_img")
			old_child = lines.get_point_count()

	# Drawing lines
	if event is InputEventMouseMotion && pressed && changing_width == false :
		curent_line.add_point(event.position - rect_position)




func _clear_all():
	for i in lines.get_children():
		lines.remove_child(i)








func _on_send_color(modulate):
	lines.default_color = modulate


func _on_HSlider_drag_ended(value_changed):
	changing_width = false
	lines.width = $"../../../HSlider".value



func _on_HSlider_drag_started():
	changing_width = true
	print("test")
