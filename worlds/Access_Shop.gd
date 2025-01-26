extends Node2D

var exitAble = false
@onready var tooltip = $"../CanvasLayer/Control/InteractTooltip"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(exitAble and Input.is_action_pressed("Interact")):
		get_tree().change_scene_to_file("res://worlds/placeholder_world.tscn")
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		exitAble = true
		tooltip.visible = true
	pass # Replace with function body.


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		exitAble = false
		tooltip.visible = false
	pass # Replace with function body.
