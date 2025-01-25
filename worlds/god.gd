extends Node

var word_inventory = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func trim_word(word):
	var new_word = ""
	var regex = RegEx.new()
	var allowed_characters = "[A-Za-z]"
	regex.compile(allowed_characters)
	for valid_character in regex.search_all(word):
		new_word += valid_character.get_string()
	return new_word
	
func add_and_trim_word(word):
	word_inventory[trim_word(word)] = null
