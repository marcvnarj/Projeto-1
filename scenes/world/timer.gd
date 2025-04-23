extends Timer


func _ready() -> void:
	start(1.0)
	Events.game_ended.connect(game_ended)


func _on_timeout() -> void:
	Global.add_score(-1)
	start(1.0)


func game_ended(_won: bool) -> void:
	stop()
