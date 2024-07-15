extends Line2D
class_name Trails


########### variables ##################
var queue: Array
export var MAX_LENGHT:int = 20


##line 2d test

#####################          easter egg   :)        ############################
var yanis:Array = [
	("res://asset\'s/letters/Block_Y.png"),
	("res://asset\'s/letters/Block_A.png"),
	("res://asset\'s/letters/Block_n.png"),
	("res://asset\'s/letters/Block_I.png"),
	("res://asset\'s/letters/Block_S.png")
]

func _ready():
	randomize()
	var index = int(rand_range(0,4))
	texture = load(yanis[index])

func _process(_delta):
	var pos = _get_position()
	########### we are using a fifo type array so the element at the end of the queue will 
	###### be deleted and new one will be added to the line2D node 
	queue.push_front(pos)
	if queue.size() > MAX_LENGHT:
		queue.pop_back()
	
	##clear all the point and redraw the line 
	clear_points()
	for point in queue:
		add_point(point)

func _clear_all_points() -> void:
	while queue.size() > 0:
		queue.pop_back()


####### we can take the position of others node by overwriding this function
func _get_position() -> Vector2:
	return get_global_mouse_position()
