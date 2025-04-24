extends Control


@onready var label_title: Label = %LabelTitle
@onready var label_score: Label = %LabelScore


func _ready() -> void:
	Events.game_ended.connect(change_label)


func change_label(won: bool) -> void:
	label_score.text = "SCORE: %d" % Global.score
	if won:
		label_title.text = "YOU WON!"
	else:
		label_title.text = "YOU LOSE" 
