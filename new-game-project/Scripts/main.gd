extends Node2D

var pNode
var nodes=[]

func _ready():
	pNode=preload("res://person_node.tscn")


func _process(delta: float) -> void:
	pass

var midDown
var initPos
var camInitPos
@onready var camera=$Camera2D
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_down"):
		var c=pNode.instantiate()
		#c.scale*=10
		c.position=Vector2.ZERO
		#c.position.x=int(get_global_mouse_position().x)%20
		#c.position.y=int(get_global_mouse_position().y)%20
		#c.position*20
		c.position=get_global_mouse_position()
		add_child(c)
		nodes.append(c)
		
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("midDown"):
		midDown=true
		initPos=get_viewport().get_mouse_position()
		camInitPos=camera.position
	if Input.is_action_just_released("midDown"):
		midDown=false
		initPos=Vector2.ZERO
	if midDown:
		camera.position=camInitPos-1*pow(1/camera.scale.x,3)*(get_viewport().get_mouse_position()-initPos)
		#print(initPos)
	else:
		initPos=get_viewport().get_mouse_position()	
