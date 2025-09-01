extends Node
class_name AbstractState

var debug_enabled: bool = true

@export var animation_name: String

var animation_player: AnimationPlayer
var state_machine: StateMachine

func enter():
	animation_player.play(animation_name)

func process(_delta: float) -> void:
	pass


func end(_current_animation: String):
	animation_player.play(_current_animation)
	#debug('end: animation ' + _current_animation + ' ended, will play ' + _current_animation)

func exit(_new_state: String):
	state_machine.switch_to_state(_new_state)


func debug(text: String):
	if debug_enabled:
		print(text)
