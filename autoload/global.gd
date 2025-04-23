extends Node


var score: int = 0
var is_game_running: bool = true


func _ready() -> void:
	Events.game_ended.connect(game_ended)


func add_score(value: int) -> void:
	score += value
	score = clampi(score, 0, 1000)
	Events.score_changed.emit(score)


func game_ended(won: bool) -> void:
	is_game_running = false
