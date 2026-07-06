extends Area2D

var speed = 5
var direction = Vector2(0,0)

signal left_hit

func _process(delta):
	if Input.is_action_pressed('left_bat_up'):
		direction = Vector2(0,-1)
	elif Input.is_action_pressed('left_bat_down'):
		direction = Vector2(0,1)
	else:
		direction = Vector2(0,0)

	var velocity = speed * direction
	position += velocity

func _on_body_entered(body: Node2D) -> void:
	left_hit.emit()
	$CollisionShape2D.set_deferred("disabled", true)
	$collision_corr.start()

func _on_collision_corr_timeout() -> void:
	$CollisionShape2D.set_deferred("disabled", false)
