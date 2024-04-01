extends Node2D

@onready var lit = false
@onready var point_light_2d = $PointLight2D
@onready var fire = $Fire

func _process(delta):
	point_light_2d.enabled = lit
	fire.emitting = lit

func _on_area_2d_area_entered(area):
	var campfires = get_tree().get_nodes_in_group("Campfires")
	for campfire in campfires:
		if campfire.lit:
			campfire.lit = false
	if area.collision_layer == 1:
		lit = true
		Globals.savePoint = position + Vector2(0,24)

