extends Node
class_name TeaMenu

enum Results {COMPLETE, INCOMPLETE, BROKEN_UP, FAIL}
enum Teas{Green_Mango}

var menu = {["green", "mango"]: Teas.Green_Mango}
var words_to_keys = {}

var translator: SynonymTranslator
func _init():
	translator = SynonymTranslator.new()
	for key in menu.keys():
		for word in key:
			words_to_keys[word] = key

func order_is_relevant(order):
	if !translator.is_order_relevant(order):
		return false
	return true

func find_words_in_key(key, order):
	var words_to_found = {}
	for item in key:
		words_to_found[item] = false
	for item in order:
		if words_to_found.has(item):
			words_to_found[item] = true
	return words_to_found
		
func process_order(order):
	if !order_is_relevant(order):
		return null
	var synonymd_order = translator.get_all_relevant_words_in_order(order)
	var keys = []
	for word in synonymd_order:
		keys.append(words_to_keys[word])
		
	var found_info = []
	for key in keys:
		found_info.append(find_words_in_key(key, synonymd_order))
	
	
		
		
		
	
	
			
		
		
