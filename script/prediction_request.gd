extends Node



func _check_connexion():
	if !$HTTPRequest.connect("request_completed", self, "_on_request_completed"):
		var toast = Toast.new("ERROR: SERVER CONNEXION", Toast.LENGTH_LONG)
		get_node("/root").add_child(toast)
		toast.show()
		yield(toast,"done")
		SceanTransition.change_scene("res://scene's/menu/level_selector_screen/level_selector.tscn")
		return 

func _ready():
	# Connect signals
	_check_connexion()

	# URL of the server
	var server_url = "http://192.168.1.10:5000/predict"
	#TODO: send the data by converting the image to mat
	# Data to send for prediction
	var input_data = [[0.1, 0.2, 0.3],[1,2,3,4],[1,2,3,4],[1,2,3,4]]  # Provide your input data here
	
	# Send data to server for prediction
	var headers = ["Content-Type: application/json"]
	var body = {'input': input_data}
	
	# Convert body to JSON format
	var body_json = JSON.print(body)
	
	# Send POST request
	$HTTPRequest.request(server_url, headers, false, HTTPClient.METHOD_POST, body_json)




func _on_HTTPRequest_request_completed(result, response_code, _headers, body):
	if result == HTTPClient.RESULT_SUCCESS and response_code == 200:
		# Parse the response
		var response_dict = JSON.parse(body.get_string_from_utf8())
		var prediction = response_dict['prediction']
		
		# Use the prediction as needed
		print("Prediction:", prediction)
	else:
		print("Error:", result, response_code)
	
