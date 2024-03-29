extends Sprite2D

@onready var fire = $Fire
@onready var point_light_2d = $PointLight2D

@export var lit : bool

func _ready():
	fire.emitting = lit
	point_light_2d.enabled = lit
