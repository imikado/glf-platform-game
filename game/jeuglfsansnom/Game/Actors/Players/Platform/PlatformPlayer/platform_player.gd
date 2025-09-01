extends AbstractActor
class_name PlatformPlayer

const SPEED = 1800.0
const SPEED_MAX =  3250.0
const JUMP_VELOCITY = -270.0
const SUPER_JUMP_VELOCITY = -450.0

var speed := SPEED
var acceleration := 1.2

const SUPER_ACCELERATION := 1.8

const STATE_IDLE = "idle"
const STATE_WALKING = "walking"
const STATE_USE_MAGIC_STICK = "use-magic-stick"

const ANIM_USER_MAGIC_STICK="use-magic-stick"
const ANIM_USER_MAGIC_FREEZE="use-magic-freeze"
const ANIM_USER_MAGIC_FIRE="use-magic-fire"

var has_magic_stick = false

var current_jump_velocity := JUMP_VELOCITY

@onready var magicStick = $Sprite2D/magicStick

@onready var hitBoxArea:CollisionShape2D=$Sprite2D/hit/CollisionShape2D

var anim_magic_stick:String='use-magic-stick'

func select_magic_stick():
	anim_magic_stick=ANIM_USER_MAGIC_STICK

func select_magic_freeze():
	anim_magic_stick=ANIM_USER_MAGIC_FREEZE

func _ready() -> void:
	hitBoxArea.disabled=true

func bring_magic_stick():
	has_magic_stick = true
	magicStick.visible = has_magic_stick

func get_current_state() -> AbstractPlatfomPlayerState:
	return _get_current_state()

func _physics_process(delta: float) -> void:

	if get_current_state().has_gravity and not is_on_floor():
		velocity += get_gravity() * delta

	if get_current_state().can_jump and PlayerInputSingleton.does_player_press_jump() and is_on_floor():
		velocity.y = current_jump_velocity

	if has_magic_stick and PlayerInputSingleton.does_player_press_use_magic_stick():
		print('swithch magick stick')
		switch_to_state_and_override_animation(STATE_USE_MAGIC_STICK,anim_magic_stick)
 
	if get_current_state().can_move_left_and_right:
		
		var direction: float = PlayerInputSingleton.get_player_left_or_right_direction()
		if direction:
			if get_current_state().name == STATE_IDLE:
				switch_to_state(STATE_WALKING)

			if get_current_state().has_gravity and not is_on_floor():
				velocity.x = move_toward(velocity.x, direction * speed, acceleration)
			else:
				velocity.x = move_toward(velocity.x, direction * speed*delta, acceleration)
 
			sprite.flip_h = (direction == -1)

			if direction == -1:
				magicStick.position.x = -10
				hitBoxArea.position.x =-10
				
			else:
				magicStick.position.x = 0
				hitBoxArea.position.x =10

			 

		else:
			
			velocity.x = move_toward(velocity.x, 0, SPEED)

			if velocity.x == 0:
				switch_to_state(STATE_IDLE)

		
	move_and_slide()
	
func improve_jump_velocity():
	current_jump_velocity = SUPER_JUMP_VELOCITY
	acceleration = SUPER_ACCELERATION
	speed = SPEED_MAX
	$Sprite2D.modulate = Color(1, 2, 1)


func _on_hit_body_entered(body: Node2D) -> void:
 	
	if anim_magic_stick==ANIM_USER_MAGIC_STICK && body.has_method('damaged'):
		body.damaged()
	elif anim_magic_stick==ANIM_USER_MAGIC_FREEZE && body.has_method('freezed'):
		body.freezed()
