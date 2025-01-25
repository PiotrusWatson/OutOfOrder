extends CharacterBody2D

@onready var mover = $Components/Mover
@onready var face = $Body/Face
func _ready():
	mover.init(self)
	face.play()

func _physics_process(delta: float) -> void:
	# Add the gravity.
		
	var direction := Input.get_axis("Left", "Right")
	mover.move(delta, direction)
	
