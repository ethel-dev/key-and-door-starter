extends CharacterBody2D

var isHazard = true
var health = 3
var motion = Vector2()
var isStatic = true

const SPEED = 300


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (!isStatic):
		velocity = motion.normalized() * SPEED 
		
		var collision_info = move_and_collide(velocity * delta)
		if (collision_info):
			motion = velocity.bounce(collision_info.get_normal())
			velocity = motion
	
	pass

func _on_body_entered(body):
	
	pass # Replace with function body.


func _on_start_timer_timeout():
	motion.x = randf_range(-1, 1)
	motion.y = randf_range(-1, 1)
	isStatic = false
	
	pass # Replace with function body.


func _on_visible_on_screen_notifier_2d_screen_entered():
	$StartTimer.start()
	
	pass # Replace with function body.


func _on_hit_box_area_entered(area):
	if "Bullet" in area.name:
		queue_free()
	
	pass # Replace with function body.
