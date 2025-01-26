extends CharacterBody2D

@onready var mover = $Components/Mover
@onready var face = $Body/Face
@onready var timer = $Countdown

func _ready():
	mover.init(self)
	face.play()

func _process(delta: float) -> void:
	##if(timer.get_script().get_property_value("noTime")):
	##	print("timeout")
	pass

func _physics_process(delta: float) -> void:
	# Add the gravity.
		
	var direction := Input.get_axis("Left", "Right")
	mover.move(delta, direction)
	
