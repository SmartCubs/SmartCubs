extends CanvasLayer

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



