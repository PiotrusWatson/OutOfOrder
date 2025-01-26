extends Node2D

@export var placeholder_dialogues: Array[DialogueResource]
@onready var time_between_sentences = $DialogueTimer
@onready var time_between_dialogues = $PauseBetweenDialogues
@onready var speech_bubble = $SpeechBuble
var dialogue_index = 0
var current_line: DialogueLine = null
signal player_can_hear(text)
signal player_cannot_hear()
signal new_line_spoken(text)
signal dialogue_over
var talking = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	speech_bubble.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_audible_dialogue_zone_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") and talking:
		player_can_hear.emit(current_line.text)
		


func _on_dialogue_timer_timeout() -> void:
	if current_line == null:
		end_dialogue()
		return
	set_current_line(await placeholder_dialogues[dialogue_index].get_next_dialogue_line(current_line.next_id))

func set_current_line(text):
	if text == null:
		end_dialogue()
		return
	current_line = text
	new_line_spoken.emit(text.text)
	

func _on_audible_dialogue_zone_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player_cannot_hear.emit()


func _on_dialogue_start_timer_timeout() -> void:
	start_dialogue()
	
func end_dialogue():
	dialogue_over.emit()
	time_between_sentences.stop()
	talking = false
	speech_bubble.visible = false
	time_between_dialogues.start()

func start_dialogue():
	current_line = await placeholder_dialogues[dialogue_index].get_next_dialogue_line()
	time_between_sentences.start()
	talking = true
	speech_bubble.visible = true

func _on_pause_between_dialogues_timeout() -> void:
	dialogue_index += 1
	if dialogue_index >= len(placeholder_dialogues):
		return
	start_dialogue()
	
