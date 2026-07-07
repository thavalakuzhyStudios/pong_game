extends RigidBody2D

var speed = 500
var direction = Vector2(1,0)


func _ready():
	apply_impulse(speed*direction, Vector2(0,0))
	
func reverse_dir():	
	direction.x *= -1
	#direction.y = 0
	direction.y = -0.2 + 0.4*randf()
	speed += 50
	apply_impulse(2*speed*direction, Vector2(0,0))
