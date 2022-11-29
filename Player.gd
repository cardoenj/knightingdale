extends KinematicBody2D


const MAX_SPEED = 50
const ACCELERATION = 500
const FRICTION = 500

enum {
	MOVE,
	ATTACK,

}
var state = MOVE
var velocity = Vector2.ZERO
var knockback_vector = Vector2.RIGHT

onready var _animated_sprite = $AnimatedSprite
onready var hitbox = $Hitbox

func _physics_process(delta):
	match state:
		MOVE:
			move_state(delta)
		ATTACK:
			attack_state(delta)
	
func attack_state(delta):
	velocity = Vector2.ZERO
	
func move_state(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized();
	
	if input_vector.x < 0:
		_animated_sprite.flip_h = true
	else:
		_animated_sprite.flip_h = false
		
	if input_vector != Vector2.ZERO:
		hitbox.knockback_vector = input_vector
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	if Input.is_action_just_pressed("Attack"):
		state = ATTACK
	move_and_slide(velocity)
