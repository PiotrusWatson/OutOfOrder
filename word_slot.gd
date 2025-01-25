extends ReferenceRect

@onready var word_label = $Label
var is_full = false
# Called when the node enters the scene tree for the first time.

func fill_slot(word):
	word_label.text = word
	is_full = true
	
func reset_slot():
	word_label.text = ""
	is_full = false

func get_word():
	return word_label.text
