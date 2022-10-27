extends KinematicBody

export (float) var speed = 1.0
export (float) var sprintMultiplier = 2.0

# warning-ignore:unused_argument
func _physics_process(delta):
	var velocity = Vector3.ZERO
	
	if Input.is_action_pressed("move_right"):
		velocity.x -= 1
		
	if Input.is_action_pressed("move_left"):
		velocity.x += 1

	if Input.is_action_pressed("move_down"):
		velocity.z -= 1
		
	if Input.is_action_pressed("move_up"):
		velocity.z += 1
		
	velocity = velocity.normalized()
	
	if Input.is_action_pressed("sprint"):
		velocity = velocity * sprintMultiplier
	
	if Input.is_action_pressed("interact"):
		if $RayCast.is_colliding():
			var collider = $RayCast.get_collider()
			if collider.is_in_group("minigame"):
				collider.emit_signal("activated")

	if velocity:
		look_at(transform.origin + velocity, Vector3.UP)
	
# warning-ignore:return_value_discarded
	move_and_slide(velocity * speed)
