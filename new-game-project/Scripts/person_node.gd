extends Node2D

var attribute={
	"Charisma": 1,
	"Fame":1, 
	"Hope":1
	
}

var stats={
	"Health":1,
	"Wealth":1,
	"Happiness":1,
	"Fitness":1,
	"Contentness":1
}
var mouseDown=false

		
var mouseIn=false
var mousePos
func _ready():
	pass
	
func _process(delta: float) -> void:
	mousePos=get_global_mouse_position()
	if Input.is_action_just_pressed("MouseDown"):
		mouseDown=true
	if Input.is_action_just_released("MouseDown"):
		mouseDown=false
	if mouseDown and mouseIn:
		global_position=mousePos
	

func _on_area_2d_mouse_entered() -> void:
	mouseIn=true

func _on_area_2d_mouse_exited() -> void:
	mouseIn=false
