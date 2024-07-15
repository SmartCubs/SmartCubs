extends Trails

onready var drag_obj = $"../.."





func _ready()->void:
	texture = drag_obj.texture_normal
	width = drag_obj.get_rect().size.y

func _get_position()->Vector2:
	
	return drag_obj.get_global_rect().position + drag_obj.get_global_rect().size/2 


