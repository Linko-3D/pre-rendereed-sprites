extends KinematicBody2D

export var player = false
var speed = 12500
var direction = "down"

func _physics_process(delta):
	if player == false:
		return
	
	var motion = Vector2()

	#Run

	if Input.is_action_pressed("ui_up") and not Input.is_action_pressed("ui_down") and not Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		direction = "up"
		$AnimatedSprite.play("run_" + direction)
		motion = Vector2(0, -0.5) 

	if Input.is_action_pressed("ui_down") and not Input.is_action_pressed("ui_up") and not Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		direction = "down"
		$AnimatedSprite.play("run_" + direction)
		motion = Vector2(0, 0.5) 

	if Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_up") and not Input.is_action_pressed("ui_down") and not Input.is_action_pressed("ui_right"):
		direction = "left"
		$AnimatedSprite.play("run_" + direction)
		motion = Vector2(-1, 0)

	if Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_up") and not Input.is_action_pressed("ui_down") and not Input.is_action_pressed("ui_left"):
		direction = "right"
		$AnimatedSprite.play("run_" + direction)
		motion = Vector2(1, 0) 

	#Run in Diagonal

	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_down") and not Input.is_action_pressed("ui_right"):
		direction = "up_left"
		$AnimatedSprite.play("run_" + direction)
		motion = Vector2(-0.75, -0.375)

	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_down") and not Input.is_action_pressed("ui_left"):
		direction = "up_right"
		$AnimatedSprite.play("run_" + direction)
		motion = Vector2(0.75, -0.375)

	if Input.is_action_pressed("ui_down") and Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_up") and not Input.is_action_pressed("ui_right"):
		direction = "down_left"
		$AnimatedSprite.play("run_" + direction)
		motion = Vector2(-0.75, 0.375) 

	if Input.is_action_pressed("ui_down") and Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_up") and not Input.is_action_pressed("ui_left"):
		direction = "down_right"
		$AnimatedSprite.play("run_" + direction)
		motion = Vector2(0.75, 0.375)

	#Idle

	if motion == Vector2():
		$AnimatedSprite.play("idle_" + direction)

	#Make the character moves
	move_and_slide(motion * speed * delta)

	#Quit the game with escape

	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
