extends Node2D

func hit_register():	
	$ball.reverse_dir()

func game_over():
	#$ball.hide()
	var ball_pos = $ball_start_marker.global_position
	$ball.global_position = ball_pos
	$ball.linear_velocity = Vector2(0,0)	
	$newgameTimer.start()
	#print(ball_pos)

func _on_newgame_timer_timeout() -> void:	
	$ball.show()
	$ball.game_start()
	$left_bat.game_start()
	$right_bat.game_start()
