extends Node



signal verify

# URL of the server
const SERVER_URL = "http://192.168.114.87:5000/predict"

var image:Image

#const SERVER_URL = "http://192.168.43.199:5000/predict"
func _check_connexion():
	pass
	



func _send_request() -> void:
	# Capture Image
	#TODO: send the data by converting the image to mat
	image = get_node("%Viewport").get_texture().get_data()
	image.flip_y()
	image.convert(Image.FORMAT_L8)
	image.resize(28,28,Image.INTERPOLATE_CUBIC)
	image.save_png("res://test.png")
	
	
	var input_data =  Array( image.get_data())
		# Send data to server for prediction
	var headers = ["Content-Type: application/json"]
	var body = {'input': input_data}
		# Convert body to JSON format
	var body_json = JSON.print(body)
		
		# Send POST request
	var error = $HTTPRequest.request(SERVER_URL, headers, false, HTTPClient.METHOD_POST, body_json)
	if error != OK:
			var toast = Toast.new("An error occurred in the HTTP request.", Toast.LENGTH_LONG)
			get_node("/root").add_child(toast)
			toast.show()
			yield(toast,"done")
			push_error("An error occurred in the HTTP request.")
			SceanTransition.change_scene("res://scene's/menu/level_selector_screen/level_selector.tscn")
			return 



func _on_request_completed(result, response_code, _headers, body):
	if response_code == 200:
		var json_data = JSON.parse(body.get_string_from_utf8())

		var message = json_data.result["key"]
		emit_signal("verify",message)
		print("Received message from server:", message)
	else:
		print("Error:", result, response_code)


func _on_draw_space_send_img():
	_send_request()
