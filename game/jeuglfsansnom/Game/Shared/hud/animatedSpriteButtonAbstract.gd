extends Control
class_name AnimatedSpriteButtonAbstract

signal press

@export var animatedSprite:AnimatedSprite2D


func _input(event: InputEvent) -> void:
	# Check if the mouse is over the button
	if get_rect().has_point(get_local_mouse_position()):
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_LEFT:
				if event.pressed:
					press.emit()
