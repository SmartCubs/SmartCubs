extends CanvasLayer

onready var audio_stream = $audio_stream

export (String,FILE ,"*.mp3") var audio:String

var menu_music = preload("res://asset\'s/audio/main-menu.mp3")
var data_main

func _ready():
	audio_stream.stream = menu_music
	
	yield(get_tree().create_timer(2),"timeout")
	audio_stream.play()
	print("audio on")


func audio_pause(pause:bool = true) ->void:
	audio_stream.stream_paused = pause

func _get_audio_state()->bool:
	return audio_stream.stream_paused

func _audio_start()->void:
	audio_stream.play(.5)

func change_audio():
	pass

func _get_data():
	return data_main

func change_scene(target: String, type:String = "up",data=null ) :
	if type == 'r':
		randomize()
		var random = int(rand_range(0,2))
		match random:
			0: type = 'd'
			1: type = "up"
	if type == "d":
		$AnimationPlayer.play("dissolve")
		yield($AnimationPlayer,"animation_finished")
		get_tree().change_scene(target)
		$AnimationPlayer.play_backwards("dissolve")
	elif type == "up":
		$AnimationPlayer.play("up")
		yield($AnimationPlayer,"animation_finished")
		get_tree().change_scene(target)
		$AnimationPlayer.play("continue up")
	data_main = data
	return data
