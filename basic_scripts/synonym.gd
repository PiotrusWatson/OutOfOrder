extends Node
class_name SynonymTranslator

var translation = {
	["inexperienced", "color"] : "green",
	["exotic", "pulp"]: "mango"
}

var relevant_words = []

func _init():
	for key in translation.keys():
		relevant_words.append_array(key)

func trim_irrelevant_words(order):
	var trimmed_order = []
	for word in order:
		if word in relevant_words:
			trimmed_order.append(word)
	return trimmed_order	
			
func is_order_relevant(order):
	var trimmed_order = trim_irrelevant_words(order)
	var j = 1
	for i in range(len(trimmed_order)):
		j = i+1
		if j >= len(trimmed_order):
			break
		
		var check = [trimmed_order[i], trimmed_order[j]]
		if translation.has(check):
			return true
	return false

func get_all_relevant_words_in_order(order):
	var relevant_words = []
	var trimmed_order = trim_irrelevant_words(order)
	var j = 1
	for i in range(len(trimmed_order)):
		j = i+1
		if j >= len(trimmed_order):
			break
		
		var check = [trimmed_order[i], trimmed_order[j]]
		if translation.has(check):
			relevant_words.append(translation[check])
	return relevant_words
		
