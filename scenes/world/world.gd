extends Node2D


@onready var background_audio: AudioStreamPlayer = $BackgroundAudio
@onready var died_menu: Control = $DiedMenu


func _ready() -> void:
	Events.game_ended.connect(game_ended)


func game_ended(won: bool) -> void:
	background_audio.stop()
	died_menu.show()
