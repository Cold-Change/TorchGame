extends CharacterBody2D

@onready var animation_player = $AnimationPlayer

@export var speed : int

func _physics_process(delta):
	var direction = Input.get_vector("left","right","up","down")
	manageAnimations(direction)
	velocity = direction * speed
	move_and_slide()

func manageAnimations(direction):
	if direction:
		animation_player.play("Walk")
	else:
		animation_player.play("Idle")
