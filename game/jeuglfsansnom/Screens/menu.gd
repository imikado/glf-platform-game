extends Node2D

@export var main : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_button_button_up() -> void:
	get_tree().change_scene_to_packed(main)
	pass # Replace with function body.
