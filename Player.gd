extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var isVulnerable = true
var canShoot = true
var bullet = preload("res://Bullet.tscn")

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	Global.player = self
	Global.player_direction = Vector2(-1, 0)
	
func shoot():
	var bullet_instance = bullet.instantiate()
	owner.add_child(bullet_instance);
	bullet_instance.transform = global_transform
 
func _physics_process(delta):
	var motion = Vector2()

	$AnimatedSprite2D.play()
	
	if Input.is_action_just_pressed("ui_accept") and canShoot:
		# shoot a bullet
		$BulletTimer.start()
		canShoot = false
		
		shoot()
		pass
	
	#if isVulnerable:
	if Input.is_action_pressed("ui_up"):
		motion.y -= 1
		$AnimatedSprite2D.animation = "up"
		Global.player_direction = motion
	elif Input.is_action_pressed("ui_down"):
		motion.y += 1
		$AnimatedSprite2D.animation = "down"
		Global.player_direction = motion
	elif Input.is_action_pressed("ui_left"):
		motion.x -= 1
		$AnimatedSprite2D.animation = "left"
		$AnimatedSprite2D.flip_h = false
		Global.player_direction = motion
	elif Input.is_action_pressed("ui_right"):
		motion.x += 1
		$AnimatedSprite2D.animation = "left"
		$AnimatedSprite2D.flip_h = true
		Global.player_direction = motion
	else:
		$AnimatedSprite2D.frame = 0
		$AnimatedSprite2D.stop()
		
	# close game if dies
	if Global.health == 0:
		get_tree().quit()
	
	velocity = motion.normalized() * SPEED
	
	move_and_slide()


func _on_invincibility_timer_timeout():
	isVulnerable = true;
	$AnimatedSprite2D.self_modulate = Color(1.0, 1.0, 1.0, 1);
	pass # Replace with function body.


func _on_player_enemy_hitbox_body_entered(body):
	if (isVulnerable and "Hazard" in body.name):
		# Starting invincibility window here
		isVulnerable = false;
		$InvincibilityTimer.start()
		$AnimatedSprite2D.self_modulate = Color(1.0, 0, 0, 1);
		Global.health -= 1
		get_node("../CanvasLayer/Label/").text = "Health: " + str(Global.health)
	
	pass # Replace with function body.


func _on_bullet_timer_timeout():
	canShoot = true
	pass # Replace with function body.
