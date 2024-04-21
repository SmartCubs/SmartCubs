extends Trails


onready var level = get_node("%level")
var pos:Vector2 = Vector2.ZERO
func _ready():
	width = level.get_rect().size.y
func _get_position():
	pos = level.get_rect().position + level.get_rect().size/2 
	return pos
