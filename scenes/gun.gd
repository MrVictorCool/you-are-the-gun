extends Node2D

signal shoot(direction)

@onready var sprite_2d: Sprite2D = $Sprite2D

const BULLET := preload("res://scenes/bullet.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	
	rotation_degrees = wrap(rotation_degrees, 0, 360)
	if rotation_degrees > 90 and rotation_degrees < 270:
		scale.y = -1
	else:
		scale.y = 1
	
	if Input.is_action_just_pressed("fire"):
		var bullet_inst = BULLET.instantiate()
		get_tree().root.add_child(bullet_inst)
		bullet_inst.global_position = global_position
		bullet_inst.rotation = rotation
		shoot.emit(rotation)
