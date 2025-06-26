extends CharacterBody2D

const SPEED = 25
const JUMP_VELOCITY = -50
const GRAVITY = 300.0
const MAX_JUMPS = 2  # Allows single + double jump

var jumps_left = MAX_JUMPS

func _physics_process(delta: float) -> void:
	# Apply gravity
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	else:
		velocity.y = 0
		jumps_left = MAX_JUMPS  # Reset jump count on landing

	# Jumping
	if Input.is_action_just_pressed("ui_accept") and jumps_left > 0:
		velocity.y = JUMP_VELOCITY
		jumps_left -= 1

	# Horizontal movement
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction != 0:
		velocity.x = direction * SPEED

		# Flip the sprite depending on direction
		if direction < 0:
			$Sprite2D.flip_h = true
		else:
			$Sprite2D.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Apply movement
	move_and_slide()
