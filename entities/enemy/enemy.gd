extends CharacterBody2D


const SPEED: float = 40.0

@export var death_sfx: AudioStreamWAV = null

var direction: int = 1

@onready var hurt_box: Area2D = $HurtBox
@onready var texture: AnimatedSprite2D = $Texture
@onready var audio_stream_player: AudioStreamPlayer = $Audio
@onready var hit_box: Area2D = $HitBox


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

	animation()
	move_and_slide()


func animation () -> void:
	if direction != 0:
		texture.play("walk")


func play_sound(song: AudioStreamWAV) -> void:
	audio_stream_player.stream = song
	audio_stream_player.play()


func _on_hurt_box_area_entered(_area: Area2D) -> void:
	hurt_box.queue_free()
	hit_box.queue_free()
	Global.add_score(50)
	play_sound(death_sfx)
	direction = 0
	texture.play("death")
	await texture.animation_finished
	queue_free()


func _on_hit_box_area_entered(_area: Area2D) -> void:
	direction = 0
	texture.play("Idle")
