extends Button

signal word_taken(word)
# Called when the node enters the scene tree for the first time.


func _on_pressed() -> void:
	word_taken.emit(text)
