extends Node2D



func fall():
	rotation_degrees-=195
	position.x+=5
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is PlatformPlayer:
		queue_free()
		body.improve_jump_velocity()
	pass # Replace with function body.
