extends Area2D

signal right_scores()

func _on_body_entered(body: Node2D) -> void:
	right_scores.emit()
