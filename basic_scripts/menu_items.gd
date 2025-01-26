extends Node
class_name TeaMenu



var menu = {["green", "mango"]: "Green Tea With Mango"}
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

func is_order_complete(words_to_found):
	var found = true
	for word in words_to_found:
		found = found and words_to_found[word]
	return found

func is_order_incomplete(words_to_found):
	for word in words_to_found:
		if words_to_found[word]:
			return true
	return false
	
func get_item_from_info(words_to_found):
	var item = []
	for word in words_to_found:
		item.append(word)
	return menu[item]

func process_order(order):
	if !order_is_relevant(order):
		return {"status": Globals.Results.FAIL, "item": null}
	var synonymd_order = translator.get_all_relevant_words_in_order(order)
	var keys = []
	for word in synonymd_order:
		keys.append(words_to_keys[word])
		
	var found_info = []
	for key in keys:
		found_info.append(find_words_in_key(key, synonymd_order))
	var incomplete_order = null
	for info in found_info:
		if is_order_complete(info):
			return {"status": Globals.Results.COMPLETE, "item": get_item_from_info(info)}
		if is_order_incomplete(info):
			incomplete_order = info
	
	if incomplete_order != null:
		return {"status": Globals.Results.INCOMPLETE, "item": get_item_from_info(incomplete_order)}
	return {"status": Globals.Results.FAIL, "item": null}
	
	
	
		
		
		
	
	
			
		
		
