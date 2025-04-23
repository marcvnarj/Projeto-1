extends Area2D


@export var coin_sfx: AudioStreamWAV

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func play_sound(sound: AudioStreamWAV) -> void:
	audio_stream_player.stream = sound
	audio_stream_player.play()


func _on_body_entered(_body: Node2D) -> void:
	play_sound(coin_sfx)
	Global.add_score(20)
	animated_sprite_2d.queue_free()
	await audio_stream_player.finished
	queue_free()
