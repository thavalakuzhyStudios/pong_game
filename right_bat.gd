extends Area2D

var speed = 5
var direction = Vector2(0,0)
var screen_size
#var mouse_velocity_ent # for mouse input

signal right_hit

func _ready():
	screen_size = get_viewport_rect().size
	screen_size.y -= 100

# for mouse input
#func _input(event: InputEvent) -> void:
	#if event is InputEventMouseMotion:
		#var mouse_delta: Vector2 = event.relative
		#var mouse_position: Vector2 = event.position
		#var mouse_velocity: Vector2 = event.velocity
		#mouse_velocity_ent = mouse_velocity

func _process(_delta):
	if Input.is_action_pressed('right_bat_up'):
		direction = Vector2(0,-1)
	elif Input.is_action_pressed('right_bat_down'):
		direction = Vector2(0,1)
	else:
		direction = Vector2(0,0)
		
	var velocity = speed * direction
	position += velocity
	position = position.clamp(Vector2(0,100), screen_size)
	
	# for mouse input
	#if mouse_velocity_ent:
		#mouse_velocity_ent.x = 0
		#mouse_velocity_ent.y *= 0.015
		#print(mouse_velocity_ent)
		#position += mouse_velocity_ent
		#position = position.clamp(Vector2(0,100), screen_size)

func _on_body_entered(_body: Node2D) -> void:
	right_hit.emit()
	speed += 1
	$CollisionShape2D.set_deferred("disabled", true)
	$collision_corr.start()

func _on_collision_corr_timeout() -> void:
	$CollisionShape2D.set_deferred("disabled", false)
