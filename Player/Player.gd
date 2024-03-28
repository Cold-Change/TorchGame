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
		#if animation_player.current_animation != "Walk":
			#animation_player.play("Transition")
			#print("Transition to walk")
			#await animation_player.animation_finished
		animation_player.play("Walk")
		print("Walking")
	else:
		if animation_player.current_animation != "Idle":
			animation_player.play("Transition")
			print("Transition to idle")
			await animation_player.animation_finished
		animation_player.play("Idle")
		print("Idling")
