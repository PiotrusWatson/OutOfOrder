extends CanvasLayer

@export var inventory_size = 15
@export var button_prefab: PackedScene
@onready var container = $Control/TextureRect/WordBox
signal word_selected(word)

var buttons = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(inventory_size):
		var button = button_prefab.instantiate()
		buttons.append(button)
		button.visible = false
		button.word_taken.connect(pick_word)
		container.add_child(button)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func update_word_pile(words):
	for i in range(len(words)):
		buttons[i].text = words[i] 
		buttons[i].visible = true
	for i in range(len(words), inventory_size):
		buttons[i].visible = false
	
func pick_word(word):
	word_selected.emit(word)
	
