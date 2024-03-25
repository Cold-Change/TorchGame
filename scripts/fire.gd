extends Node2D
class_name Fire

@onready var fire: GPUParticles2D = $Fire

func update_direction(direction: Vector2):
	fire.process_material.set("orbit_velocity_min", direction.x * 0.25)
	fire.process_material.set("orbit_velocity_max", direction.x * 0.25)
