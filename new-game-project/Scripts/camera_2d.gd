extends Camera2D

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("scrollUp"):
		zoom*=1.05
	
	if event.is_action_pressed("scrollDown"):
		zoom*=0.95
	if zoom.x<1:
		zoom.x=1
	if zoom.y<1:
		zoom.y=1
