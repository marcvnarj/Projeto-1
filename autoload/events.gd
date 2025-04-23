extends Node


@warning_ignore("unused_signal")
signal score_changed(value: int)

@warning_ignore("unused_signal")
# if true player won, if false, player died
signal game_ended(won: bool)
