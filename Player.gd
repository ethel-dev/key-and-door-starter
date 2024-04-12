extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	var motion = Vector2()

	$AnimatedSprite2D.play()
	
	if Input.is_action_pressed("ui_up"):
		motion.y -= 1
		$AnimatedSprite2D.animation = "up"
	elif Input.is_action_pressed("ui_down"):
		motion.y += 1
		$AnimatedSprite2D.animation = "down"
	elif Input.is_action_pressed("ui_left"):
		motion.x -= 1
		$AnimatedSprite2D.animation = "left"
		$AnimatedSprite2D.flip_h = false
	elif Input.is_action_pressed("ui_right"):
		motion.x += 1
		$AnimatedSprite2D.animation = "left"
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.frame = 0
		$AnimatedSprite2D.stop()
	
	velocity = motion.normalized() * SPEED
	
	move_and_slide()
