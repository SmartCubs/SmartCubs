tool
extends Control




onready var Vbox = $VBoxContainer

#########export variables
export (int) var index_music = 0
onready var icon_img_btn1:StreamTexture = preload("res://asset\'s/icons/pause.png")
onready var icon_img_btn2:StreamTexture = preload("res://asset\'s/icons/house.png")

export (Array,StreamTexture) var btn_texture = [icon_img_btn1,icon_img_btn2]

export(String,FILE,"*.tscn") var path_btn1:String = "res://scene\'s/menu/mainMenu.tscn"
export(String,FILE,"*.tscn") var path_btn2:String = "res://scene's/menu/level_selector_screen/level_selector.tscn"



onready var nbr_btn


const music_off = preload("res://asset\'s/icons/Music Off.png")



var togel_music

const path_config_file:String = "user://confige.save"
var confing



func _ready():
	if !Engine.is_editor_hint():
		confing = SaveManager._load(path_config_file)
		if confing != null && confing == false:
			togel_music = false
		else:
			togel_music = true
		SceanTransition.audio_pause(togel_music)
		
	for i in range(btn_texture.size()):
		var btn = Button.new()
		if btn:
			btn.rect_min_size = Vector2(75,75)
			btn.flat = true
			btn.expand_icon = true
			btn.icon = btn_texture[i]
			if i == _get_index_music() && togel_music == true:
				btn.icon = music_off
			btn.set_script(preload("res://script/btn.gd"))
			btn.connect("pressed",self,"_on_btn_pressed",[i,btn])
			btn.focus_mode = Control.FOCUS_NONE
			Vbox.add_child(btn)
			nbr_btn = btn_texture.size()
		else:
			printerr("error :)")

func _get_index_music():
	return index_music

func _on_btn_pressed(i:int,btn:Button):
	if i == btn_texture.size()-1:
		SceanTransition.change_scene(path_btn1)
	elif i == btn_texture.size() -2:
		SceanTransition.change_scene(path_btn2)
	elif i == btn_texture.size()- 3:
		togel_music = !togel_music
		SceanTransition.audio_pause(togel_music)
		if togel_music == true:
			btn.icon = music_off
			SaveManager._save(togel_music,path_config_file)
		else:
			btn.icon = btn_texture[i]
			SaveManager._save(togel_music,path_config_file)
			
