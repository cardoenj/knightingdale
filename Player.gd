extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var speed = 50

var velocity = Vector2(20, 20)
onready var _animated_sprite = $AnimatedSprite

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _input(event):
	print(event)
	if event.is_action_pressed("ui_right"):
		_animated_sprite.play("Running")
		$AnimatedSprite.flip_h = false
		velocity.x = speed
	elif event.is_action_pressed("ui_left"):
		_animated_sprite.play("Running")
		$AnimatedSprite.flip_h = true
		velocity.x = -speed
	elif event.is_action_pressed("ui_up"):
		_animated_sprite.play("Running")
		velocity.y = -speed
	elif event.is_action_pressed("ui_down"):
		_animated_sprite.play("Running")
		velocity.y = speed
	else:
		_animated_sprite.play("Idle")
		velocity.x = 0
		velocity.y = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _process(delta):
	velocity = move_and_slide(velocity)
