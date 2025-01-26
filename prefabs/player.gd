extends CharacterBody2D

@onready var mover = $Components/Mover
@onready var body = $Body
@onready var face = $Body/Face
signal time_travel_triggered
@onready var timer = $Countdown

func _ready():
	mover.init(self)
	face.play()
	body.play("default")

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_pressed("TimeTravel"):
		body.play("time_travel")
		face.play("constipated")
func _physics_process(delta: float) -> void:
	# Add the gravity.
	
	var direction := Input.get_axis("Left", "Right")
	mover.move(delta, direction)
	


func _on_body_animation_finished() -> void:
	if body.animation == "time_travel":
		time_travel()

func time_travel():
	time_travel_triggered.emit()
	
