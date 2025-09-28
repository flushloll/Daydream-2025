extends Camera2D

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("scrollUp"):
		zoom*=1.05
	
	if event.is_action_pressed("scrollDown"):
		zoom*=0.95
