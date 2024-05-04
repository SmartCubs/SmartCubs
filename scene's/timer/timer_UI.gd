extends HBoxContainer



var time_left = 0

onready var timer = get_node("Timer")
onready var texture_progress = $CenterContainer/TextureProgress


export (int)var max_time = 20 
export (float, .01,1.0)var speed_rate = .01


func _ready():
	_set_time(max_time)


func _process(_delta):
	texture_progress.value = (time_left /max_time)*100

	###############time left####################
	time_left -= speed_rate
	print(timer.time_left)

func _start_timer():
	timer.start()

func _stop_timer():
	timer.stop()

func _set_time(time:float):
	timer.wait_time = time
	time_left = time

func _add_time(add:float):
	time_left +=  add
