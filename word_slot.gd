extends Label

var is_full = false
# Called when the node enters the scene tree for the first time.

func fill_slot(word):
	text = word
	is_full = true
	
func reset_slot():
	text = ""
	is_full = false

func get_word():
	return text
