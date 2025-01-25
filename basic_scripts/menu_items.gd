extends Node
class_name TeaMenu

enum Teas{Green_Mango}

var menu = {["green", "mango"]: Teas.Green_Mango}
var translator: SynonymTranslator
func _init():
	translator = SynonymTranslator.new()

func translate_order(order):
	var attempted_translation = null
	var current_translation = []

			
		
		
