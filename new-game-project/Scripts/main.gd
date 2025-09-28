extends Node2D

var pNode
var nodes=[]

func _ready():
	pNode=preload("res://person_node.tscn")


func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_down"):
		var c=pNode.instantiate()
		c.scale*=10
		c.position=Vector2.ZERO
		c.position.x=int(get_global_mouse_position().x)%20
		c.position.y=int(get_global_mouse_position().y)%20
		c.position*20
		add_child(c)
		nodes.append(c)
		
func _physics_process(delta: float) -> void:
	for x in nodes:
		for y in nodes:
			if x==y:
				return
			if abs(x.global_position-y.global_position).x<100:
				print(x.global_position-y.global_position)
				x.position.x+=50
				x.position.y+=50
