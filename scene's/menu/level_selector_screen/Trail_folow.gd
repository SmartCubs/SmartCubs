extends Trails




onready var level = get_node("%level")





func _ready()->void:
	width = level.get_rect().size.y/2


func _get_position()->Vector2:
	return level.get_rect().position + level.get_rect().size/2


