extends Area2D

#signal left_scores()

func _on_body_entered(body: Node2D) -> void:
	#left_scores.emit()
	print('left_sc')
	$CollisionShape2D.set_deferred("disabled", true)
	$enableTimer.start()

func _on_enable_timer_timeout() -> void:
	$CollisionShape2D.disabled = false
