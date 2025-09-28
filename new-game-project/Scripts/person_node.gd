extends Node2D

var attribute={
	"Charisma": 1,
	"Optimism":1,
	"Wisdom":1,
	"Health":1,
	"Ambition":1
}
var pastMousePos=Vector2.ZERO 
var initPos=Vector2.ZERO

@onready var camera=get_parent().get_node("Camera2D")
var midDown=false
var mouseIn=false
var mouseDown=false
var mousePos
func _ready():
	pass


func _physics_process(delta: float) -> void:
	mousePos=get_global_mouse_position()
	if Input.is_action_just_pressed("MouseDown"):
		mouseDown=true
	if Input.is_action_just_released("MouseDown"):
		mouseDown=false
	if Input.is_action_just_pressed("midDown"):
		midDown=true
		initPos=get_viewport().get_mouse_position()
		
	if Input.is_action_just_released("midDown"):
		midDown=false
		initPos=Vector2.ZERO
	if midDown:
		camera.position=-1*(1/camera.scale.x)*(get_viewport().get_mouse_position()-initPos)
	else:
		initPos=get_viewport().get_mouse_position()	
	if mouseDown and mouseIn:
		global_position=mousePos
		

func _on_area_2d_mouse_entered() -> void:
	mouseIn=true

func _on_area_2d_mouse_exited() -> void:
	if mouseDown:
		return
	mouseIn=false
