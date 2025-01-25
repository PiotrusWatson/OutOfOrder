extends Node2D

signal player_in_range
signal player_out_of_range

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_trigger_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player_in_range.emit()


func _on_trigger_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player_out_of_range.emit()
