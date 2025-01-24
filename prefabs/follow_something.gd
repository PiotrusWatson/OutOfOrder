extends Camera2D

@export var thing_to_follow: Node2D
@export var follow_speed = 0.3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position = lerp(global_position, thing_to_follow.global_position, follow_speed)
