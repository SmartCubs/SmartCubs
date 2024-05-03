extends Control
var numb = [] #0-100
var neg = []
var rng=RandomNumberGenerator.new()
var empty=preload("res://scene's/levels/Math/Empty_Block.png")
var oper = []
var fill = []
var hide=[]
var hidden=[]
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	load_asset()
	var subt= []
	var subt2=[]
	var subt3=[]
	subt=one_eq()
	subt2=one_eq()
	subt3=one_eq()
	missing()
	var text_A = [$drag_A,$drag_A2,$drag_A3]
	var text_B = [$drag_B,$drag_B2,$drag_B3]
	var text_C = [$drag_C,$drag_C2,$drag_C3]
	var text_op = [$op_v,$op_v2,$op_v3]
	var k=0
	
	for i in range(fill.size()):
		if i%4==0:
			text_A[k].texture=numb[subt3[i]]
		elif i%4==1:
			text_op[k].texture=oper[subt3[i]]
		elif i%4==2:
			text_B[k].texture=numb[subt3[i]]
		elif i%4==3:
			text_C[k].texture=numb[subt3[i]]
			k=k+1
		pass
	pass
func load_asset():
	var temp
	var oper_name=['+','-','x']
	for i in range(100):
		var path_img="res://scene's/levels/Math/numbers/blocked_0_100/"+str(i)+".png"
		temp=load(path_img)
		numb.append(temp) #fill all texture (0-100)
	for i in range(10):
		var path_img="res://scene's/levels/Math/numbers/negative_nbr/-"+str(i+1)+".png"
		temp=load(path_img)
		neg.append(temp) #fill all texture (from -1 to -10)
	for op in oper_name:
		var path_img="res://scene's/levels/Math/operate/oper_bloc/Block_"+op+".png"
		temp=load(path_img)
		oper.append(temp) #fill all texture of '+' '-' 'x'
		
	pass
func one_eq():
	randomize()
	var choice
	var op
	var A
	var B
	for i in range(3):
		if i==0:
			choice=int(rand_range(0,11)) #1-10
			A=choice
			fill.append(A)
		elif i==1:
			choice=int(rand_range(0,3)) # 3 operations
			op=choice
			fill.append(op)
		elif i==2:
			choice=int(rand_range(0,11))
			while A<choice: #no negative numbers
				choice=int(rand_range(0,11))
			B=choice
			fill.append(B)
	var C
	if op==0:
		C=A+B
		fill.append(C)
	elif op==1:
		if(A>B):
			C=A-B
			fill.append(C)
		else:
			C=A-B
			fill.append(C)
			
	elif op==2:
		C=A*B
		fill.append(C)
	return fill #fill[id]: x of 4 or +4--> A, x of 1 or +4 --> op, x,x of 2 or +4--> B, x of 3 or +4 --> C
	#[A1,op1,B1,C1]=[0,1,2,3],[A2,op2,B2,C2]=[4,5,6,7],[A3,op3,B3,C3]=[8,9,10,11]
	#op=0-->'+'		op==1-->'-'		op=='2'-->'x'
func missing():
	var miss=[]
	for i in range(3):
		miss.append(int(rand_range(0,3))) 
	var control_indices = {
	0: [0, 2, 3],
	1: [4, 6, 7],
	2: [8, 10, 11]
	}
	for i in range(miss.size()):
		hide.append(control_indices[i][miss[i]])#the value that is hidden from fill
		print("hidden in fille index:",hide[i])
		
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
