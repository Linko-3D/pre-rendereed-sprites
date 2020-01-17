extends Node2D

var zoom = 0.3
var pan = false

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_WHEEL_DOWN and event.pressed:
			if $Camera2D.zoom.x < 0.9:
				zoom += 0.05
				$Camera2D.zoom = Vector2(zoom, zoom)
		if event.button_index == BUTTON_WHEEL_UP:
			if $Camera2D.zoom.x > 0.3:
				zoom -= 0.05
				$Camera2D.zoom = Vector2(zoom, zoom)
		
		if event.button_index == BUTTON_MIDDLE and event.pressed:
			pan = true
		if event.button_index == BUTTON_MIDDLE and event.pressed == false:
			pan = false
		
	if event is InputEventMouseMotion:
		if pan:
			$Camera2D.position -= event.relative / 2
