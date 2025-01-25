extends Node

var rigidbody: CharacterBody2D
@export var speed = 30.0

func init(rigidbody: CharacterBody2D):
	self.rigidbody = rigidbody

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func move(delta, direction):
	
	if not rigidbody.is_on_floor():
		rigidbody.velocity += rigidbody.get_gravity() * delta
		
	if direction:
		rigidbody.velocity.x = direction * speed
	else:
		rigidbody.velocity.x = move_toward(rigidbody.velocity.x, 0, speed)
	
	rigidbody.move_and_slide()
