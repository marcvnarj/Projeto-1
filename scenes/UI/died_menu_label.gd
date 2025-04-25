extends Label


func _ready() -> void:
	Events.score_changed.connect(change_label)
	change_label(Global.score)


func change_label(score: int) -> void:
	text = "SCORE: %d" % score
