extends Camera2D

const VWIDTH = 640
const VHEIGHT = 480

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var pos = get_node("../Player").global_position
	var x = floor(pos.x / VWIDTH) * VWIDTH
	var y = floor(pos.y / VHEIGHT) * VHEIGHT
	
	global_position = Vector2(x, y)
	
	pass
