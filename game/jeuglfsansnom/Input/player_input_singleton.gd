extends Node

func does_player_press_jump():
    return Input.is_action_just_pressed("jump")

func does_player_press_use_magic_stick():
    return Input.is_action_just_pressed("use_magic_stick")

func get_player_left_or_right_direction() -> float:
    return Input.get_axis("ui_left", "ui_right")