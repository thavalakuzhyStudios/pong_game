extends Area2D

var speed = 5
var direction = Vector2(0,0)
var screen_size

signal right_hit

func _ready():
	screen_size = get_viewport_rect().size
	screen_size.y -= 100

func _process(delta):
	if Input.is_action_pressed('right_bat_up'):
		direction = Vector2(0,-1)
	elif Input.is_action_pressed('right_bat_down'):
		direction = Vector2(0,1)
	else:
		direction = Vector2(0,0)

	var velocity = speed * direction
	position += velocity
	position = position.clamp(Vector2(0,100), screen_size)

func _on_body_entered(body: Node2D) -> void:
	right_hit.emit()
	print('Right')
	$CollisionShape2D.set_deferred("disabled", true)
	$collision_corr.start()

func _on_collision_corr_timeout() -> void:
	$CollisionShape2D.set_deferred("disabled", false)
