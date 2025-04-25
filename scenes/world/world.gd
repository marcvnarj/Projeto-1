extends Node2D


@onready var background_audio: AudioStreamPlayer = $BackgroundAudio
@onready var game_over: Control = %GameOver


func _ready() -> void:
	Events.game_ended.connect(game_ended)


func game_ended(_won: bool) -> void:
	background_audio.stop()
	game_over.show()

func _on_void_area_entered(_area: Area2D) -> void:
	pass 
