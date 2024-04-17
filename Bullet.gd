extends Area2D

const SPEED = 400
var bullet_direction
var bullet_travel_distance = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	bullet_direction = Vector2(Global.player_direction)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	bullet_travel_distance += SPEED
	
	if (bullet_travel_distance < 30000):
		global_position += bullet_direction * SPEED * delta
	else:
		queue_free()
		
	pass
