extends Node2D

@onready var animationPlayer:AnimationPlayer=$AnimationPlayer

func _ready():
	animationPlayer.play('running')

func fall():
	rotation_degrees-=195
	position.x+=5
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is PlatformPlayer:
		queue_free()
		GlobalEvents.got_magic_freeze_sort.emit()
	pass # Replace with function body.
