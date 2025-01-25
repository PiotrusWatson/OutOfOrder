extends Node2D

@export var placeholder_dialogue: DialogueResource = load("res://dialogue/placeholder.dialogue")
var current_line: DialogueLine = null
signal player_can_hear(text)
signal new_line_spoken(text)
signal dialogue_over
var finished = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_line = await placeholder_dialogue.get_next_dialogue_line()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_audible_dialogue_zone_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") and !finished:
		player_can_hear.emit(current_line.text)
		


func _on_dialogue_timer_timeout() -> void:
	if current_line == null:
		dialogue_over.emit()
		return
	set_current_line(await placeholder_dialogue.get_next_dialogue_line(current_line.next_id))

func set_current_line(text):
	if text == null:
		dialogue_over.emit()
		finished = true
		return
	current_line = text
	new_line_spoken.emit(text.text)
	
