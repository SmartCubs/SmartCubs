extends Button


func _ready():
	pass

func _set_img(img_name:Object):
	yield(get_tree().create_timer(.3), "timeout")
	icon = img_name


