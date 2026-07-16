extends Area2D

signal left_scores()

func _on_body_entered(body: Node2D) -> void:
	left_scores.emit()
