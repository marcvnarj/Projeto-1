extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Events.score_changed.connect(change_label)
	change_label(Global.score)


func change_label(score: int) -> void:
	text = "SCORE: %d" % score
