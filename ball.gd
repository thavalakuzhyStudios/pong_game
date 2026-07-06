extends RigidBody2D

#signal hit

var speed = 500
var direction = Vector2(1,0)
#var velocity = speed * direction

#func _ready():
	#direction = Vector2(1,0)

func _ready():
	apply_impulse(speed*direction, Vector2(0,0))

#func _process(delta):
	#velocity = speed * direction
	#position += velocity
	
func reverse_dir():	
	direction.x *= -1
	direction.y = -0.2 + 0.4*randf()
	apply_impulse(2*speed*direction, Vector2(0,0))
