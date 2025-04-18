extends CharacterBody2D


const SPEED: float = 100.0
const JUMP_VELOCITY: float = -300.0

var is_jumping: bool = false

@onready var animation: AnimatedSprite2D = $Anim


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		is_jumping = false
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		is_jumping = true
		
	
	var direction:= Input.get_axis("mv_left", "mv_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	manage_animation()
	move_and_slide()

func manage_animation() -> void:
	if not is_jumping and is_on_floor() and velocity.x != 0:
		animation.play("walk")
		var normalized: Vector2 = velocity.normalized()
		animation.scale.x = normalized.x
	elif is_jumping:
		animation.play("jump")
	elif not is_jumping and not is_on_floor():
		animation.play("fall")
	else:
		animation.play("idle")
