extends "res://scene's/menu/control_menu_UI.gd"

func _on_btn_pressed(i:int,btn:Button):
	print(btn_texture.size())
	print(i)
	if i == 1:
		SceanTransition.change_scene(path_btn1)

	elif i == 0:
		togel_music = !togel_music
		SceanTransition.audio_pause(togel_music)
		if togel_music == true:
			btn.icon = music_off
			SaveManager._save(togel_music,path_config_file)
		else:
			btn.icon = btn_texture[i]
			SaveManager._save(togel_music,path_config_file)
