extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("ColorRect").color = Global.colors[get_meta("ID")]
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	# Searching the array of keys for the ID attached to the key to see if it has already been collected or not
	if (get_meta("ID") not in Global.keys_found):
		Global.keys_found.append(get_meta("ID"))
		
	var keysfoundtext = ""
	for item in Global.keys_found:
		keysfoundtext += str(item) + " "
		
		
	# write code to add a new colorrect from UIKeyIndicator with correct color
	var uirect = ColorRect.new()
	uirect.size = Vector2(16, 16)
	uirect.position.x = 8
	uirect.position.y = 8
	uirect.color = Global.colors[get_meta("ID")]
	uirect.custom_minimum_size = Vector2(16, 16)
	
	get_node("../CanvasLayer/HBoxContainer").add_child(uirect)
	
	queue_free()
	pass # Replace with function body.
