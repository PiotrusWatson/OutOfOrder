extends Node2D

@onready var dialogue_balloon = $Balloon
@onready var yapper = $Yapper
@onready var god = $God
@onready var inventory = $Inventory
@onready var final_dialogue = $FinalDialogue
@onready var buble_tea = $BubleTea

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for yapper in get_tree().get_nodes_in_group("Yappers"):
		yapper.new_line_spoken.connect(dialogue_balloon.update_text)
		yapper.player_can_hear.connect(dialogue_balloon.show_balloon)
		yapper.dialogue_over.connect(dialogue_balloon.hide_balloon)
		yapper.player_cannot_hear.connect(dialogue_balloon.hide_balloon)
	dialogue_balloon.word_picked.connect(god.add_and_trim_word)
	god.inventory_updated.connect(inventory.update_word_pile)
	buble_tea.player_in_range.connect(final_dialogue.show_dialogue)
	buble_tea.player_out_of_range.connect(final_dialogue.hide_dialogue)

# Callded every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
