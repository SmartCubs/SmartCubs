tool
extends "res://scene's/menu/control_menu_UI.gd"

onready var draw_space = $"ViewportContainer/Viewport/draw space"




const music_index = 2
const path = "user://captured_image"


var nbr_photo = 0



func _ready():
	create_photo_dir()


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
		var image = draw_space.get_parent().get_texture().get_data()
		image.flip_y()
		image.save_png( "user://photo" + String(nbr_photo) + ".png")
		nbr_photo +=1
		print("saved")
