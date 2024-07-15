extends Control

const path = "res://photo/"
const path_id = "res://photo/id.data"

onready var grid = get_node("ScrollContainer/GridContainer")

func _ready():
	var nbr_imgs = SaveManager._load(path_id)
	if nbr_imgs != null:
		for i in range (1,nbr_imgs+1):
			var img = Image.new()
			var itex = ImageTexture.new()
			var path_img = path + str(i) +".png"
			img.load(path_img)
			itex.create_from_image(img)
			var texture = TextureRect.new()
			texture.texture = itex
			grid.add_child(texture) 
	
