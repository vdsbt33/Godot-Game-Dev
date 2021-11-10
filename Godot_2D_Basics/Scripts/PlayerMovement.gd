extends KinematicBody2D

var ACCELERATION = 100;
var FRICTION = 15;
const MAX_MOVEMENT_SPEED = 100;
var VELOCITY = Vector2.ZERO;
signal changed_velocity;

func _physics_process(delta):
	var movementInput = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		0
	).normalized();

	if (movementInput.x != 0):
		VELOCITY.x = clamp(movementInput.x * (ACCELERATION * delta), -MAX_MOVEMENT_SPEED, MAX_MOVEMENT_SPEED);
	else:
		VELOCITY.x = clamp(movementInput.x * (FRICTION * delta), -MAX_MOVEMENT_SPEED, MAX_MOVEMENT_SPEED);

	if (VELOCITY != Vector2.ZERO):
		move_and_collide(VELOCITY);

	emit_signal('changed_velocity', VELOCITY);
