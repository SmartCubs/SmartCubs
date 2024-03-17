extends CanvasLayer

onready var audio_stream = $audio_stream

export (String,FILE ,"*.mp3") var audio:String

var menu_music = preload("res://asset\'s/audio/main-menu.mp3")


func _ready():
	audio_stream.stream = menu_music
	audio_stream.play(.5)
	print("loaded")


func audio_pause(pause:bool = true) ->void:
	audio_stream.stream_paused = pause

func change_audio():
	pass


func change_scene(target: String, type:String = "up" ) ->void:
	if(type == "d"):
		$AnimationPlayer.play("dissolve")
		yield($AnimationPlayer,"animation_finished")
		get_tree().change_scene(target)
		$AnimationPlayer.play_backwards("dissolve")
	elif type == "up":
		$AnimationPlayer.play("up")
		yield($AnimationPlayer,"animation_finished")
		get_tree().change_scene(target)
		$AnimationPlayer.play("continue up")



