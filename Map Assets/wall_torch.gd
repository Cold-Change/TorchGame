extends Sprite2D

@onready var fire = $Fire
@onready var point_light_2d = $PointLight2D

@export var lit : bool

func _ready():
	fire.emitting = lit
	point_light_2d.enabled = lit
	
func _process(delta):
	fire.emitting = lit
	point_light_2d.enabled = lit

func _on_area_2d_area_entered(area):
	if area.collision_layer == 1 and not lit:
		lit = true
