extends Button


func _on_pressed() -> void:
	get_tree().reload_current_scene()
	Global.score = 0
