extends HBoxContainer
var pick=[]



func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Equations_loc_sent_vactor(full,answered,numb):
	var drag_obj = [$Dragable_obj,$Dragable_obj2,$Dragable_obj3,$Dragable_obj4,$Dragable_obj5,$Dragable_obj6]
	print("this is hide vector:",answered)#hide vector
	print("this the correct vector",full)#hidden	

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
	pass # Replace with function body.
