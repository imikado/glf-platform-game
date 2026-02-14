extends CharacterBody2D
class_name AbstractEnemy

@export var sprite: Sprite2D
@export var state_machine: StateMachine

func _get_current_state() -> AbstractState:
	return state_machine.current_state

func switch_to_state(new_state_name: String) -> void:
	state_machine.switch_to_state(new_state_name)

func switch_to_state_and_override_animation(new_state_name: String,new_anim:String) -> void:
	state_machine.switch_to_state_and_override_animation(new_state_name,new_anim)
