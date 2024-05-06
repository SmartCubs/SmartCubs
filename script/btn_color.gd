extends BTN

onready var draw_space = $"../../ViewportContainer/Viewport/draw space"
signal send_color

func _ready():
	rect_pivot_offset = rect_size/2
	connect("button_down",self,"git_color")
	

func git_color():
	emit_signal("send_color",modulate)


