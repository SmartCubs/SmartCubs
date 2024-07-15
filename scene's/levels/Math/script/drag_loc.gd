extends TextureRect

var fill=[]
# Declare member variables here. Examples:
# var a = 2
# var b = "text"




func one_eq():
	randomize()
	var choice
	var op
	var A
	var B
	var C
	for i in range(3):
		choice=int(rand_range(0,11)) #1-10
		A=choice
		fill.append(A)
		
		choice=int(rand_range(0,3)) # 3 operations
		op=choice
		fill.append(op)
		
		choice=int(rand_range(0,11))
		while A<choice: #no negative numbers
			choice=int(rand_range(0,11))
			B=choice
			fill.append(B)
	
		if op==0:
			C=A+B
			fill.append(C)
		elif op==1:
			C=A-B
			fill.append(C)
		elif op==2:
			C=A*B
			fill.append(C)
	return fill
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
