extends CanvasLayer

@onready var animation_player = $AnimationPlayer

func FadeFromBlack():
	animation_player.play("FadeFromBlack")
	await animation_player.animation_finished
	
func FadeToBlack():
	animation_player.play("FadeToBlack")
	await animation_player.animation_finished
