extends AbstractActor
class_name PlatformMushroom

const STATE_WALKING='walking';
const STATE_DAMAGED='damaged'
const STATE_FREEZED='freezed'

const SPEED = 50.0
var speed := SPEED
var acceleration := 1.2

var life:=10

var direction := -1.0

func get_current_state() -> AbstractPlatfomEnemyState:
	return _get_current_state()

func _physics_process(delta: float) -> void:
	
	if is_on_wall():
		direction *= -1

	if get_current_state().has_gravity and not is_on_floor():
		velocity += get_gravity() * delta

	if get_current_state().can_move_left_and_right:
		velocity.x = move_toward(velocity.x, direction * speed, acceleration)
	else:
		velocity.x=0
	
	move_and_slide()

func damaged():
	switch_to_state(STATE_DAMAGED)
	
func freezed():
	switch_to_state(STATE_FREEZED)

func final_die():
	life-=1
	if life<=0:
		queue_free()
