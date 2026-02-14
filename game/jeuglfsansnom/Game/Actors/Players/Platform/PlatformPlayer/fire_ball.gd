extends Area2D

const SPEED:float=50.0

var _direction=0

var _damage=5

@onready var _anim:AnimatedSprite2D=$AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if _direction==0:
		return
	
	global_position.x+=_direction*SPEED*delta
	pass


func _on_body_entered(body: Node2D) -> void:
	if body is AbstractEnemy:
		body.damaged(_damage)
	pass # Replace with function body.

func set_direction(direction)->void:
	_direction=direction
	_anim.play()
	
	get_tree().create_timer(2.0).timeout.connect(queue_free)
	pass
