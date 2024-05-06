extends "res://scene's/menu/control_menu_UI.gd"



func _get_index_music():
	return 0

func _on_btn_pressed(i:int,btn:Button):
	togel_music = !togel_music
	SceanTransition.audio_pause(togel_music)
	if togel_music == true:
		btn.icon = music_off
		SaveManager._save(togel_music,path_config_file)
	else:
		btn.icon = btn_texture[i]
		SaveManager._save(togel_music,path_config_file)
