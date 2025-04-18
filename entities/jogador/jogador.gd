extends CharacterBody2D


const SPEED: float = 100.0
const JUMP_VELOCITY: float = -300.0


@onready var animation: AnimatedSprite2D = $Anim


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction:= Input.get_axis("mv_left", "mv_right")
	if direction:
		velocity.x = direction * SPEED
		velocity.normalized()
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	anima()

	move_and_slide()

func anima() -> void:
	if is_on_floor() and velocity.x != 0:
		animation.play("walk")
		animation.scale.x = velocity.x
	elif not is_on_floor():
		animation.play("jump")
	else:
		animation.play("idle")
