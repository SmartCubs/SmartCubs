tool
extends Control




onready var Vbox = $VBoxContainer

#########export variables

onready var icon_img_btn1:StreamTexture = preload("res://asset\'s/icons/pause.png")
onready var icon_img_btn2:StreamTexture = preload("res://asset\'s/icons/house.png")

export (Array,StreamTexture) var btn_texture = [icon_img_btn1,icon_img_btn2]

export(String,FILE,"*.tscn") var path_btn1:String = "res://scene\'s/menu/mainMenu.tscn"
export(String,FILE,"*.tscn") var path_btn2:String = "res://scene's/menu/level_selector_screen/level_selector.tscn"


onready var nbr_btn


const music_off = preload("res://asset\'s/icons/Music Off.png")



var togel_music



func _ready():
	
	if !Engine.is_editor_hint():
		togel_music = SceanTransition._get_audio_state()
	
	for i in range(btn_texture.size()):
		var btn = Button.new()
		if btn:
			btn.rect_min_size = Vector2(75,75)
			btn.flat = true
			btn.expand_icon = true
			btn.icon = btn_texture[i]
			if i == btn_texture.size()-3 && togel_music == true:
				btn.icon = music_off
			btn.set_script(preload("res://script/btn.gd"))
			btn.connect("pressed",self,"_on_btn_pressed",[i,btn])
			btn.focus_mode = Control.FOCUS_NONE
			Vbox.add_child(btn)
			nbr_btn = btn_texture.size()
			print( nbr_btn)
		else:
			printerr("error :)")


func _on_btn_pressed(i:int,btn:Button):
	print(btn_texture.size())
	print(i)
	if i == btn_texture.size()-1:
		SceanTransition.change_scene(path_btn1)
	elif i == btn_texture.size()-2 :
		SceanTransition.change_scene(path_btn2)
	elif i == btn_texture.size()-3:
		togel_music = !togel_music
		SceanTransition.audio_pause(togel_music)
		if togel_music == true:
			btn.icon = music_off
		else:
			btn.icon = btn_texture[i]
		
