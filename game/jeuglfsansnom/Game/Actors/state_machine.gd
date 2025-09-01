extends AbstractStateMachine
class_name StateMachine

@export var current_state: AbstractState

@export var animation_player: AnimationPlayer

var state_list: Dictionary

func _ready():
	for state_loop in get_children():
		state_loop.animation_player = animation_player
		state_loop.state_machine = self

		state_list[state_loop.name] = state_loop

	animation_player.connect("animation_finished", animation_finished)

	enter()
	
	
func animation_finished(_animation:String):
	current_state.end(_animation)

func enter():
	current_state.enter()

func _process(delta: float) -> void:
	current_state.process(delta)
	
func only_switch_state(new_state_name: String)->bool:
	if new_state_name == current_state.name:
		return false
	
	print('switch to state ' + new_state_name)
	current_state = state_list[new_state_name]
	return true
	

func switch_to_state(new_state_name: String) -> void:
	if !only_switch_state(new_state_name):
		return
	 
	enter()
	
func switch_to_state_and_override_animation(new_state_name: String,new_animation:String):
	if !only_switch_state(new_state_name):
		return
		
	current_state.animation_name=new_animation
	
	enter()
	

	
 	
	
