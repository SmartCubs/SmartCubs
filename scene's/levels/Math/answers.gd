extends HBoxContainer
var pick=[]
var original=[]
var wrong=0


signal result



func load_asset(index) :
	var path_img="res://scene's/levels/Math/numbers/blocked_0_100/"+str(index)+".png"
	return load(path_img)



func _on_Equations_loc_sent_vactor(full,answered):
	for i in range(answered.size()):
		original.append(full[answered[i]])
	#print("correct answer",original)
	var drag_obj = [$drag_obj,$drag_obj2,$drag_obj3,$drag_obj4,$drag_obj5,$drag_obj6]
	#print("this is hide vector:",answered)#correct response
	#print("this the correct vector",full)#full equations	
	for i in answered:
		pick.append(full[i])
	var k=0
	while k<3:
		var random=int(rand_range(0,13))
		if not pick.has(random):
			pick.append(random)
			k=k+1
	pick.shuffle()
	print(pick)
	for i in range(pick.size()):
		drag_obj[i].texture_normal =  load_asset(pick[i])
		drag_obj[i].nbr=pick[i]
		print(drag_obj[i].nbr)
	pass # Replace with function body.



func _on_Equations_loc_verified_answers(verify,input):
	var wrong=0
	
	
	if input==3:
		#print(input)
		#print("i am here: ",verify)
		if verify == original:
			#print("Correct game")
			$"../Finish_Ui"._show(2,"Great Game! 3/3")
			
		else:
			for i in range(verify.size()):
				if verify[i]!=original[i]:
					wrong=wrong+1
			#print("u have done: ",wrong)
			$"../Finish_Ui"._show(1,"u have "+ String(wrong)+" mistake(s)")
	emit_signal("result",wrong)
	
	pass # Replace with function body.
