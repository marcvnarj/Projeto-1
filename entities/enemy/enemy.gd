extends CharacterBody2D


const SPEED: float = 40.0

var direction: int = 1

@onready var hurt_box: Area2D = $HurtBox
@onready var texture: AnimatedSprite2D = $Texture


func _ready() -> void:
	texture.scale.x = -1
	direction = -1


func _physics_process(delta: float) -> void:
	# Add gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if is_on_wall():
		direction *= -1
		texture.scale.x = direction
	
	velocity.x = direction * SPEED

	move_and_slide()


func _on_hurt_box_area_entered(_area: Area2D) -> void:
	hurt_box.queue_free()
	direction = 0
	texture.play("death")
	await texture.animation_finished
	queue_free()
