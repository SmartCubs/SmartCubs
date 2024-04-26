extends Node



# URL of the server
const SERVER_URL = "http://192.168.1.10:5000/predict"

func _check_connexion():
	pass
	

func _ready():
	
	#TODO: send the data by converting the image to mat
	# Data to send for prediction
	var input_data = [[0.1, 0.2, 0.3],[1,2,3,4],[1,2,3,4],[1,2,3,4]]  # Provide your input data here
	
	# Send data to server for prediction
	var headers = ["Content-Type: application/json"]
	var body = {'input': input_data}
	
	# Convert body to JSON format
	var body_json = JSON.print(body)
	
	# Send POST request
	var error = $HTTPRequest.request(SERVER_URL, headers, false, HTTPClient.METHOD_POST, body_json)
	
	print(error)
	if error != OK:
		var toast = Toast.new("An error occurred in the HTTP request.", Toast.LENGTH_LONG)
		get_node("/root").add_child(toast)
		toast.show()
		yield(toast,"done")
		push_error("An error occurred in the HTTP request.")
		SceanTransition.change_scene("res://scene's/menu/level_selector_screen/level_selector.tscn")
		return 



var image
func _input(event: InputEvent) -> void:

	if event is InputEventKey and event.is_action_pressed("ui_down"):

		
		
		# Capture Image
		image = get_node("%Viewport").get_texture().get_data()
		image.flip_y()
		
		
		
		# Get image dimensions
		var width = 28
		var height = 28

		# Initialize a matrix to store the pixel values
		var matrix = []

		
	
		var input_data = matrix
		
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
		 # Now you can access the data in the JSON format
		# For example, if the response is a JSON object with a key "message":
		var message = json_data.result["key"]
		print("Received message from server:", message)
	else:
		print("Error:", result, response_code)
