extends Node

var word_inventory = {}

signal inventory_updated(inventory)
signal gave_a_menu_item(result)
var menu_parser: TeaMenu
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	menu_parser = TeaMenu.new()

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
	return new_word.to_lower()
	
func add_and_trim_word(word):
	word_inventory[trim_word(word)] = null
	inventory_updated.emit(word_inventory.keys())
	
func parse_order(order):
	var result = menu_parser.process_order(order)
	gave_a_menu_item.emit(result)
		
