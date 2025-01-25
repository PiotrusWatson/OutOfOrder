extends Node2D

@onready var dialogue_balloon = $Balloon
@onready var yapper = $Yapper
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	yapper.new_line_spoken.connect(dialogue_balloon.update_text)
	yapper.player_can_hear.connect(dialogue_balloon.show_balloon)
	yapper.dialogue_over.connect(dialogue_balloon.hide_balloon)

# Callded every fdrame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
