extends Node


signal score_changed(_value: int)


# if true player won, if false, player died
signal game_ended(_won: bool)
