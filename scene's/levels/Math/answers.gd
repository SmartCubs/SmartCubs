extends HBoxContainer
var pick=[]



func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Equations_loc_sent_vactor(full,answered,numb):
	var drag_obj = [$drag_obj,$drag_obj2,$drag_obj3,$drag_obj4,$drag_obj5,$drag_obj6]
	print("this is hide vector:",answered)#correct response
	print("this the correct vector",full)#full equations	
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
		drag_obj[i].texture_normal=numb[pick[i]]
		drag_obj[i].nbr=pick[i]
		print(drag_obj[i].nbr)
	pass # Replace with function body.