extends Node2D
var namae
var attribute={
	"Charisma": 1,
	"Optimism":1,
	"Wisdom":1,
	"Health":1,
	"Ambition":1
}

var inRange=[]

var pastMousePos=Vector2.ZERO 
var initPos=Vector2.ZERO
var camInitPos=Vector2.ZERO
@onready var camera=get_parent().get_node("Camera2D")
var midDown=false
var mouseIn=false
var mouseDown=false
var mousePos

var grid=[-2,-1,0,1,2]
var taken=[false,false,false,false]

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
		camInitPos=camera.position
	if Input.is_action_just_released("midDown"):
		midDown=false
		initPos=Vector2.ZERO
	if midDown:
		camera.position=camInitPos-1*pow(1.2/camera.scale.x,3)*(get_viewport().get_mouse_position()-initPos)
		#print(initPos)
	else:
		initPos=get_viewport().get_mouse_position()	
	if mouseDown and mouseIn:
		global_position=mousePos
	if not mouseDown and int(position.y)%20!=0:
		position.y=(int(position.y)%20)*20
		print(int(position.y))
	if not mouseDown and int(position.x)%20!=0:
		position.x=(int(position.x)%20)*20
		print(int(position.x))
			
func _on_area_2d_mouse_entered() -> void:
	mouseIn=true

func _on_area_2d_mouse_exited() -> void:
	if mouseDown:
		return
	mouseIn=false


func _on_effect_area_entered(area: Area2D) -> void:
	inRange.append(area)
	#print(inRange)

func _on_effect_area_exited(area: Area2D) -> void:
	inRange.remove_at(inRange.find(area))
