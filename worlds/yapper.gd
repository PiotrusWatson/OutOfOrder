extends Sprite2D

@export var placeholder_dialogue: DialogueResource = load("res://dialogue/placeholder.dialogue")
var current_line: DialogueLine = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_line = await placeholder_dialogue.get_next_dialogue_line()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_audible_dialogue_zone_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		print(current_line)
		


func _on_dialogue_timer_timeout() -> void:
	if current_line == null:
		return
	current_line = await placeholder_dialogue.get_next_dialogue_line(current_line.next_id)
