extends CharacterBody2D


const SPEED: float = 100.0
const JUMP_VELOCITY: float = -350.0

@export var jump_sfx: AudioStreamWAV = null
@export var death_sfx: AudioStreamWAV = null
@export var coin_sfx: AudioStreamWAV = null

@onready var animation: AnimatedSprite2D = $Texture
@onready var audio_stream_player: AudioStreamPlayer = $Audio


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		play_sound(jump_sfx)
	
	var direction:= Input.get_axis("mv_left", "mv_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	manage_animation()
	move_and_slide()


func manage_animation() -> void:
	var normalized: Vector2 = velocity.normalized()
	if is_on_floor() and velocity.x != 0:
		animation.play("walk")
	elif normalized.y < 0 and not is_on_floor():
		animation.play("jump")
	elif not is_on_floor() and normalized.y > 0:
		animation.play("fall")
	else:
		animation.play("idle")
	if normalized.x == 1 or normalized.x == -1:
		animation.scale.x = normalized.x


func play_sound(sound: AudioStreamWAV) -> void:
	audio_stream_player.stream = sound
	audio_stream_player.play()


func _on_hit_box_area_entered(_area: Area2D) -> void:
	velocity.y = JUMP_VELOCITY * 0.8
	animation.play("jump")
