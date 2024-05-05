extends HBoxContainer



var time_left = 0
var start:bool = false

signal time_out


onready var texture_progress = $CenterContainer/TextureProgress

export (float)var max_speed = 1
export (float)var max_time = 20 
export (float, .01,1.0)var speed_rate = .01


func _ready():
	_set_time(max_time)
	


func _process(_delta):
	texture_progress.value = (time_left /max_time)*100

	###############time left####################
	time_left -= speed_rate
	if time_left <= 0:
		emit_signal("time_out")
		queue_free()
		get_tree().queue_delete(self)

func _start_timer():
	start = true


func _set_time(time:float):
	time_left = time

func _add_time(add:float):
	if time_left + add >= max_time:
		time_left = max_time
	else:
		time_left +=  add


func _add_speed(speed:float):
	if speed_rate + speed >= max_speed:
		speed_rate = max_speed
	else:
		speed_rate += speed
