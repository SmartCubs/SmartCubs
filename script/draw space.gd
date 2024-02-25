extends Control

onready var lines := $Node2D/lines

var pressed = false
var curent_line: Line2D

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		pressed = event.pressed

		# Making line
		if pressed:
			curent_line = Line2D.new()
			curent_line.default_color = lines.default_color
			curent_line.width = lines.width
			lines.add_child(curent_line)

	# Drawing lines
	if event is InputEventMouseMotion && pressed:
		curent_line.add_point(event.position - rect_position)
	
