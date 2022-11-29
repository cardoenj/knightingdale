extends StaticBody2D

onready var animatedSprite = $AnimatedSprite
onready var soundPlayer = $AudioStreamPlayer
var isOpened = false
var playerHasEntered = false

func _play():
	if Input.is_action_pressed("Interact") and isOpened == false:
		soundPlayer.play(0.3)
		animatedSprite.play("Open")
		
func _process(delta):
	if playerHasEntered:
		_play()

func _on_AnimatedSprite_animation_finished():
	isOpened = true
	soundPlayer.stop()
	animatedSprite.play("Idle")

func _on_Area2D_area_entered(_area):
	playerHasEntered = true
