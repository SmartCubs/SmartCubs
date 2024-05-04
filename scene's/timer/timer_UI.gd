extends HBoxContainer



var time_left = 0
var start:bool = false

signal time_out

onready var texture_progress = $CenterContainer/TextureProgress


export (int)var max_time = 20 
export (float, .01,1.0)var speed_rate = .01


func _ready():
	_set_time(max_time)
	


func _process(_delta):
	texture_progress.value = (time_left /max_time)*100

	###############time left####################
	time_left -= speed_rate
	print(time_left)
	if time_left <= 0:
		emit_signal("time_out")

func _start_timer():
	start = true


func _set_time(time:float):
	time_left = time

func _add_time(add:float):
	time_left +=  add
