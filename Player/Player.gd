extends CharacterBody2D

@onready var animation_player = $AnimationPlayer
@onready var point_light_2d = $Torch/PointLight2D
@onready var fire = $Torch/Fire
@onready var fire_hurt_box = $Torch/Fire/FireHurtBox

@onready var lit = true
@onready var speed = 50

@export var next_level : PackedScene

func _physics_process(delta):
	point_light_2d.enabled = lit
	fire.emitting = lit
	fire_hurt_box.monitoring = lit
	var direction = Input.get_vector("left","right","up","down")
	if lit:
		manageAnimations(direction)
		velocity = direction * speed
		move_and_slide()

func manageAnimations(direction):
	if direction:
		animation_player.play("Walk")
	else:
		animation_player.play("Idle")

func _on_fire_hurt_box_area_entered(area):
	if area.collision_layer == 2:
		death()
	elif area.collision_layer == 4:
		get_tree().paused = true
		await Transitions.FadeToBlack()
		get_tree().paused = false
		if next_level:
			get_tree().change_scene_to_packed(next_level)
		else:
			get_tree().change_scene_to_file("res://Levels/game_over.tscn")
		Transitions.FadeFromBlack()
		

func death():
	print("Player dies")
	lit = false
	animation_player.play("Death")
	await animation_player.animation_finished
	await Transitions.FadeToBlack()
	position = Globals.savePoint
	lit = true
	Transitions.FadeFromBlack()
