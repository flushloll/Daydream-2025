extends Node2D

var pNode

func _ready():
	pNode=preload("res://person_node.tscn")


func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_down"):
		var c=pNode.instantiate()
		c.scale*=10
		add_child(c)
	
