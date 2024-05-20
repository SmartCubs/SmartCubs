tool
extends "res://scene's/menu/control_menu_UI.gd"

onready var draw_space = $"ViewportContainer/Viewport/draw space"




const music_index = 2
const path = "user://photo/"
const path_id = "user://photo/id.data"

var nbr_photo = 1
var load_btn


func _ready():
	create_photo_dir()
	nbr_photo = SaveManager._load(path_id)
	if nbr_photo == null:
		Vbox.get_child(0).visible = false



func create_photo_dir():
	var dir = Directory.new()
	if !dir.dir_exists(path):
		dir.make_dir(path)
	


func _get_index_music():
	return music_index

func _on_btn_pressed(i:int,btn:Button):
	print(i)
	if i == 4:
		SceanTransition.change_scene(path_btn1)
	elif i == 3:
		SceanTransition.change_scene(path_btn2)
	elif i == 2:
		togel_music = !togel_music
		SceanTransition.audio_pause(togel_music)
		if togel_music == true:
			btn.icon = music_off
			SaveManager._save(togel_music,path_config_file)
		else:
			btn.icon = btn_texture[i]
			SaveManager._save(togel_music,path_config_file)
	elif i == 1:
		##### get image from viewport
		var image = draw_space.get_parent().get_texture().get_data()
		#######load last id stoped in #############
		nbr_photo = SaveManager._load(path_id)
		if nbr_photo == null:
			nbr_photo = 1
			Vbox.get_child(0).visible = true
		else:
			nbr_photo +=1
		var path_img = path + str(nbr_photo) +".png"
		image.flip_y()
		image.save_png(path_img)
		image.convert(Image.FORMAT_L8)
		SaveManager._save(nbr_photo,path_id)
	elif i ==0:
		SceanTransition.change_scene("res://scene\'s/levels/drawing_world/load_imgs.tscn","r")
