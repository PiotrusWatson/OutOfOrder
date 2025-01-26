extends CanvasLayer

@onready var answer_box = $Control/TextureRect/Answers
@onready var vendor_question = $Control/TextureRect/VendorQuestion
@onready var vendor_response = $Control/TextureRect/VendorResponse
@onready var order_submitter = $Control/TextureRect/SubmitAnswer
@export var answer_num = 5
@export var answer_prefab: PackedScene
var answers = []
var answer_index = 0
signal order_submitted(order)

func show_dialogue():
	visible = true
	
func hide_dialogue():
	visible = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(answer_num):
		var answer = answer_prefab.instantiate()
		answers.append(answer)
		answer_box.add_child(answer)
	hide_dialogue()
	vendor_response.visible = false
	vendor_question.visible = false
		
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
	order_submitter.visible = false
	order_submitted.emit(order)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func show_results_of_order(result):
	
	if result["status"] == Globals.Results.COMPLETE:
		vendor_response.text = "Vendor: Alright. One " + result["item"] + " coming right up"
		vendor_response.visible = true
	if result["status"] == Globals.Results.FAIL:
		vendor_response.text = "Vendor: Got no idea what ur talking about m8. Get out!"
		vendor_response.visible = true
	if result["status"] == Globals.Results.INCOMPLETE:
		vendor_question.text = "Vendor: Really unsure what ur saying there m8. You want the " + result["item"] + "?"
		vendor_question.visible = true
func _on_submit_answer_pressed() -> void:
	submit_order()
