extends Control

signal press

@onready var animatedSprite:AnimatedSprite2D=get_node('AnimatedSprite2D')
@export var animatedSpiteSpriteFrames:SpriteFrames

@onready var selectedSquare:ColorRect=get_node('ColorRect')

func _ready() -> void:
	animatedSprite.sprite_frames=animatedSpiteSpriteFrames
	
func select():
	selectedSquare.visible=true
	animatedSprite.visible=true
	animatedSprite.play()
	
func unselect():
	selectedSquare.visible=false
	animatedSprite.stop()

func _input(event: InputEvent) -> void:
	# Check if the mouse is over the button
	if selectedSquare.get_rect().has_point(get_local_mouse_position()):
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_LEFT:
				if event.pressed:
					press.emit()
