extends RigidBody2D

var speed = 500
var direction = Vector2(1,0)
var st_direction = Vector2(1,0)

signal right_scores()
signal left_scores()

func _ready():
	$startTimer.start()
	
func game_start():
	print('game_start')
	$startTimer.start()
	speed = 500
	st_direction.x *= -1
	direction.x = st_direction.x
	direction.y = 0
	print(direction)

func start_timer_exp():
	print('ball push')
	apply_impulse(speed*direction, Vector2(0,0))

func reverse_dir():	
	direction.x *= -1
	direction.y = -0.2 + 0.4*randf()
	speed += 50
	apply_impulse(2*speed*direction, Vector2(0,0))
	

func _process(_delta):
	#print(global_position.x)
	if global_position.x <= 0:
		global_position.x = 100
		right_scores.emit()
		
	elif global_position.x >= 1152:
		global_position.x = 100
		left_scores.emit()
		
		
