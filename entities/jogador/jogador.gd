extends CharacterBody2D


const SPEED: float = 100.0
const JUMP_VELOCITY: float = -400.0

var jumping: bool = false

@onready var animation: AnimatedSprite2D = $Anim


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jumping = true
	elif is_on_floor():
		jumping = false

	var direction:= Input.get_axis("mv_left", "mv_right")
	if direction:
		velocity.x = direction * SPEED
		animation.scale.x = direction
		if !jumping:
			animation.play("walk")
	elif jumping:
		animation.play("jump")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animation.play("idle")

	move_and_slide()
