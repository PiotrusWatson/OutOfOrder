extends CanvasLayer

@onready var text_holder = $Balloon/Panel/Dialogue/VBoxContainer/Textholder
@export var button_prefab: PackedScene

signal word_picked(word)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide_balloon()
	
func show_balloon(text):
	layer = 2
	update_text(text)
	visible = true
	
func hide_balloon():
	visible = false
	layer = -1

func update_text(text):
	wipe_text()
	display_text(text)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
### this is very expensive! make this less expensive by making a pool of buttons
### when we have a more clear idea of the size the text fits into
func display_text(text):
	for word in text.split(" "):
		var button = button_prefab.instantiate()
		button.text = word
		button.word_taken.connect(pick_word)
		# setup script to take words here
		text_holder.add_child(button)
		
func wipe_text():
	for child in text_holder.get_children():
		text_holder.remove_child(child)
		child.queue_free()
func pick_word(text):
	word_picked.emit(text)
