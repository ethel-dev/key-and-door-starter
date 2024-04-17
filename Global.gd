extends Node

# Initialize global variables
var health = 10
var keys_found = []
var colors
var player
var player_direction

# Called when the node enters the scene tree for the first time.
func _ready():
	# Where we will assign values to our global variables
	colors = {
		0: Color(0.372549, 0.619608, 0.627451, 1),
		1: Color(1, 0.980392, 0.803922, 1)
	}
	
	pass # Replace with function body.
