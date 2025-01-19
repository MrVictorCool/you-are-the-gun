extends CharacterBody2D

@export var speed := 10.0
@export var target: Node2D
@export var recoil := 500
@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D

func _ready() -> void:
	Engine.time_scale = 0

func _physics_process(delta: float) -> void:
	var dir = to_local(navigation_agent_2d.get_next_path_position()).normalized()
	velocity += dir * speed
	velocity = velocity * 0.9
	
	move_and_slide()


func makepath() -> void:
	navigation_agent_2d.target_position = target.global_position


func _on_timer_timeout() -> void:
	makepath()


func _on_gun_shoot(rot) -> void:
	velocity = velocity + Vector2(cos(rot + 180) * recoil, sin(rot + 180) * recoil)

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		Engine.time_scale = 1
