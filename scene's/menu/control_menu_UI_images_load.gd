tool
extends "res://scene's/menu/control_menu_UI.gd"


func _get_index_music():
	return 1

func _on_btn_pressed(i:int,btn:Button):
	print(i)
	if i == 3:
		SceanTransition.change_scene(path_btn1)
	elif i == 2:
		SceanTransition.change_scene(path_btn2)
	elif i == 1:
		togel_music = !togel_music
		SceanTransition.audio_pause(togel_music)
		if togel_music == true:
			btn.icon = music_off
			SaveManager._save(togel_music,path_config_file)
		else:
			btn.icon = btn_texture[i]
			SaveManager._save(togel_music,path_config_file)
	elif i == 0:
		SceanTransition.change_scene("res://scene\'s/levels/drawing_world/drawing_world.tscn","r")
