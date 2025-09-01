extends Node2D

@onready var hud:HudPlatform=$PlatformPlayer/Camera2D/HUD

@onready var player:PlatformPlayer=$PlatformPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
		
	GlobalEvents.got_magic_freeze_sort.connect(on_player_got_magic_freeze_sort)
	GlobalEvents.got_magic_stick.connect(on_player_got_magic_stick)

	pass # Replace with function body.

func on_player_got_magic_stick():
	hud.enableIcon(HudPlatform.MAGIC_STICK)
	hud._on_magic_stick_press()

func on_player_got_magic_freeze_sort():
	hud.enableIcon(HudPlatform.MAGIC_FREEZE)
	hud._on_magic_freeze_press()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_hud_player_select_magic_fire() -> void:
	pass # Replace with function body.


func _on_hud_player_select_magic_freeze() -> void:
	player.select_magic_freeze()

	pass # Replace with function body.


func _on_hud_player_select_magic_stick() -> void:
	player.select_magic_stick()
	pass # Replace with function body.
