extends HBoxContainer



var time_left = 0

onready var timer = get_node("Timer")
onready var texture_progress = $CenterContainer/TextureProgress


export (int)var max_time = 20 

func _ready():
	_set_time(max_time)


func _process(_delta):
	texture_progress.value = (time_left /max_time)*100
	_add_time(200)


func _start_timer():
	timer.start()

func _stop_timer():
	timer.stop()

func _set_time(time:float):
	timer.wait_time = time
	time_left = time

func _add_time(add:float):
	time_left +=  add
