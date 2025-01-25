extends CanvasLayer

@onready var answer_box = $Control/TextureRect/Answers
@export var answer_num = 5
@export var answer_prefab: PackedScene
var answers = []
var answer_index = 0
signal order_submitted(order)


func toggle_visible(is_visible):
	visible = is_visible
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(answer_num):
		var answer = answer_prefab.instantiate()
		answers.append(answer)
		answer_box.add_child(answer)
	toggle_visible(false)
		
func fill_answer_at_index(word):
	if answer_index >= answer_num:
		return
	answers[answer_index].fill_slot(word)
	if answer_index < answer_num - 1:
		answer_index += 1

func backspace():
	if answer_index == 0:
		return
	answers[answer_index].reset_slot()
	if answer_index > 0:
		answer_index -= 1

func submit_order():
	var order = []
	for answer in answers:
		if answer.is_full:
			order.append(answer.get_word())
			
	order_submitted.emit(order)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_submit_answer_pressed() -> void:
	submit_order()
