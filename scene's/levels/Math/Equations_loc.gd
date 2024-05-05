extends Control
var numb = [] #0-100
var neg = []
var rng=RandomNumberGenerator.new()
var init=0
var empty=load("res://scene\'s/levels/Math/drag_folder/drag_to.tscn")
var setting=load("res://scene\'s/levels/Math/hard_selector/Hard_selector.tscn")
var oper = []
var fill = []
var hide=[]
var verify=[null,null,null]
signal sent_vactor
signal verified_answers
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	load_asset()
	var subt3=[]
	subt3=one_eq()
	subt3=one_eq()
	subt3=one_eq()

	missing()
	var text_A = [$drag_A,$drag_A2,$drag_A3]
	var text_B = [$drag_B,$drag_B2,$drag_B3]
	var text_C = [$drag_C,$drag_C2,$drag_C3]
	var text_op = [$op_v,$op_v2,$op_v3]
	var k=0
	#########test
	
	for i in range(fill.size()):
		if i%4==0:
			if fill[i]==-1:
				var inst:Drag_to = empty.instance()
				inst.set_global_position(text_A[k].get_global_rect().position-get_parent().rect_position)
				inst.rect_size = text_A[k].rect_size
				inst.index=k
				inst.connect("Verify_nbr",self,"get_nbr")
				
				get_parent().call_deferred("add_child", inst)
			else:
				text_A[k].texture=numb[fill[i]]
		elif i%4==1:
			text_op[k].texture=oper[fill[i]]
		elif i%4==2:
			if fill[i]==-1:
				var inst:Drag_to = empty.instance()
				inst.set_global_position(text_B[k].get_global_rect().position-get_parent().rect_position)
				inst.rect_size = text_B[k].rect_size
				inst.index=k
				inst.connect("Verify_nbr",self,"get_nbr")
				
				get_parent().call_deferred("add_child", inst)
			else:
				text_B[k].texture=numb[fill[i]]
		elif i%4==3:
			if fill[i]==-1:
				var inst:Drag_to = empty.instance()
				inst.set_global_position(text_C[k].get_global_rect().position-get_parent().rect_position)
				inst.rect_size = text_C[k].rect_size
				inst.index=k
				inst.connect("Verify_nbr",self,"get_nbr")
				
				get_parent().call_deferred("add_child", inst)
				
			else:
				text_C[k].texture=numb[fill[i]]
			k=k+1
		pass
	pass
func load_asset():
	var temp
	var oper_name=['+','-','x']
	for i in range(101):
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
			choice=int(rand_range(1,11)) #1-10
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
		
	var real=fill
	emit_signal("sent_vactor",real,hide,numb)
	for i in range(hide.size()):
		fill[hide[i]]=-1
	
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func get_nbr(nbr,index):
	
	if nbr!=null:
		#print("I am",nbr,"FROM EQUATION",index)
		verify[index]=nbr
		init=init+1
		emit_signal("verified_answers",verify,init)
	if nbr==null:
		#print("am free",index)
		init=init-1
		verify[index]=nbr
		emit_signal("verified_answers",verify,init)
	
	pass



func _on_Difficulty_manager_pressed():
	SceanTransition.change_scene("res://scene\'s/levels/Math/hard_selector/Hard_selector.tscn","d")
	pass # Replace with function body.
