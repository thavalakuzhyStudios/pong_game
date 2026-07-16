extends CanvasLayer

var left_sc = 0
var right_sc = 0

func _ready():
	$score.text = str(left_sc)+' - '+str(right_sc)

func right_scores():
	right_sc += 1
	$score.text = str(left_sc)+' - '+str(right_sc)

func left_scores():
	left_sc += 1
	$score.text = str(left_sc)+' - '+str(right_sc)
