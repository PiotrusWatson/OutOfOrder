extends Node

@onready var label = $CanvasLayer/Control/Label
@onready var timer = $Timer
@onready var noTime = false

signal timeOut

func _ready():
	timer.start()
	
func time_left_to_live():
	var time_left = timer.time_left
	var minute = floor(time_left / 60)
	var second = int(time_left) % 60
	return [minute, second]
	
func _process(delta):
	label.text = "%02d:%02d" %time_left_to_live()
	


func _on_timer_timeout() -> void:
	noTime = true
