extends CharacterBody2D

@onready var dash_timer: Timer = $DashTimer
@onready var delay_timer: Timer = $DelayTimer
@onready var fire: Fire = $Fire

@export var speed := 500.0
@export var weight := 10.0
@export var dash_multiplier := 10.0

var last_direction := Vector2()

func _physics_process(delta):
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var speed_curr := speed

	if not dash_timer.is_stopped():
		speed_curr *= dash_multiplier
		direction = direction.normalized()

	if Input.is_action_just_pressed("move_dash"):
		if delay_timer.is_stopped():
			dash_timer.start()

	fire.update_direction(direction)
	velocity = lerp(velocity, direction * speed_curr, delta * weight)
	last_direction = direction
	move_and_slide()

func _on_dash_timer_timeout() -> void:
	delay_timer.start()
