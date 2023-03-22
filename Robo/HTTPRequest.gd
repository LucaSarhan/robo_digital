extends HTTPRequest

# Function that runs at the beginning of the program, which makes the HTTP request

func _ready():
	
	self.connect("request_completed", self, "_on_request_completed")
	
	var abc = self.request("http://127.0.0.1:5000/godot")
	
	if abc != OK:
		
		push_error("Um erro ocorreu!")

# If the request is successful, it will show the values ​​read

func _on_request_completed(result, response_code, headers, body):
	
	var positions = parse_json(body.get_string_from_utf8())
	
	print(positions)
