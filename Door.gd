extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("ColorRect").color = Global.colors[get_meta("ID")]
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if (get_meta("ID") in Global.keys_found):
		
		queue_free()
	
	pass # Replace with function body.
