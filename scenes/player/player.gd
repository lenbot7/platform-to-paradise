extends CharacterBody2D


class_name Player


@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


const SPEED = 200.0
const JUMP_VELOCITY = -350.0


var dashed_already: bool = false


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if is_on_floor():
		dashed_already = false
	velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if Input.is_action_just_pressed("dash") and not dashed_already:
		velocity.x += direction * 500
		dashed_already = true
	if velocity.x < 0:
		animated_sprite_2d.flip_h = true
	elif velocity.x > 0:
		animated_sprite_2d.flip_h = false
	if direction:
		velocity.x = move_toward(velocity.x, direction * SPEED, 50)
		animated_sprite_2d.play("walk")
	else:
		velocity.x = move_toward(velocity.x, 0, 17.5)
		animated_sprite_2d.play("default")
	if Input.is_action_just_pressed("dash") and not dashed_already:
		if direction:
			velocity.x += direction * 250
			dashed_already = true

	move_and_slide()
