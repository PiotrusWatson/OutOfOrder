extends Node
class_name TeaMenu

enum Teas{Green_Mango}

var menu = {["green", "mango"]: Teas.Green_Mango}
var translator: SynonymTranslator
func _init():
	translator = SynonymTranslator.new()

func order_is_relevant(order):
	if !translator.is_order_relevant(order):
		return false
	return true

func process_order(order):
	if !order_is_relevant(order):
		return null
	
			
		
		
