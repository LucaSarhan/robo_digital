extends KinematicBody

# Constants for moving the player

const velocity = 1

const interval = 0.001

# Player position and speed variables

var future_position := Vector3(0,0,0)

var current_position := Vector3(0,2,0)

var speed := Vector3(0,0,0)

# Signal for the HUD

signal positionjogador(px, py, pz)

# Function that equalizes the positions and determines the direction of movement

func Position_Player(init, final, axis):
	
	if final > init:
		
		if axis == "x": speed.x = velocity
		
		elif axis == "y": speed.y = velocity
		
		elif axis == "z": speed.z = velocity
		
		return init + velocity
		
	elif final < init:
		
		if axis == "x": speed.x = -velocity
		
		elif axis == "y": speed.y = -velocity
		
		elif axis == "z": speed.z = -velocity
		
		return init - velocity
		
	else:
		
		if axis == "x": speed.x = 0
		
		elif axis == "y": speed.y = 0
		
		elif axis == "z": speed.z = 0
		
		return init

# If the HTTP request succeeds, it will start the function

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	
	var positions = parse_json(body.get_string_from_utf8()) # Value received in JSON

	# To each set of coordinates (x,y,z), move or player

	for position in positions:
		
		print(position)
		
		future_position.x = position['X']
		
		print("X: ", future_position.x)
		
		future_position.y = position['Y']
		
		print("Y: ", future_position.y)
		
		future_position.z = position['Z']
		
		print("Z: ", future_position.z)
		
		# As long as a coordinate is different, a value will be added until it equals

		while (current_position.x != future_position.x or current_position.y != future_position.y or current_position.z != future_position.z):
			
			current_position.x = Position_Player(current_position.x, future_position.x, "x")
			
			current_position.y = Position_Player(current_position.y, future_position.y, "y")
			
			current_position.z = Position_Player(current_position.z, future_position.z, "z")
			
			print(current_position.x, ", ", current_position.y, ", ", current_position.z) # Show current coordinates

			move_and_slide(speed) # move the player

			emit_signal("positionjogador", current_position.x, current_position.y, current_position.z) # Emits a signal to the HUD

			yield(get_tree().create_timer(interval), "timeout") # delay
