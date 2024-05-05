tool
extends AnimatedSprite

var all_pos = {
	"show":0,
	"idel":1,
	"happy":2
}
export (int ,"cat","dog") var animal = 0
export (int,"show","idel","happy")var curent_pos = 0
export (Array,String)var speach

func _ready():
	if not Engine.editor_hint:
		print("test")
#	if !speach.empty():
#		for text in speach:
#			yield($TextToSpeech2D.say(text, TextToSpeechEngine.VOICE_AEW, 1), "completed")
	pass


func _set_pose(pose:int ):
	curent_pos = pose

func _process(_delta):
	if curent_pos != frame:
		frame = curent_pos
	if animal == 0:
		animation = "cat"
	else:
		animation = "dog"
	

func _speek(text:String,speed:float = 1.0):
	yield($TextToSpeech2D.say(text, TextToSpeechEngine.VOICE_AEW, speed), "completed")
