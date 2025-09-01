extends Node2D

@onready var animation_player:AnimationPlayer=$AnimationPlayer
@export var spawned_item: PackedScene

var has_spawned:bool=false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is PlatformPlayer:
		animation_player.play("hit_box")
		pass
	pass # Replace with function body.

func spawn_item():
	if has_spawned:
		return
	has_spawned=true
	
	var new_spawned_item:Node2D=spawned_item.instantiate()
	add_child(new_spawned_item)
	new_spawned_item.global_position.y=global_position.y-6
	new_spawned_item.global_position.x+=1
	new_spawned_item.fall()
	
	
