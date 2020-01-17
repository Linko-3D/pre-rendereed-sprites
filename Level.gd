extends Node2D

var zoom = 0.3

func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_WHEEL_DOWN):
		print("a")
	if Input.is_action_pressed("ui_down"):
		zoom += 0.005
		$Camera2D.zoom = Vector2(zoom, zoom)
	if Input.is_action_pressed("ui_up"):
		zoom -= 0.005
		$Camera2D.zoom = Vector2(zoom, zoom)
