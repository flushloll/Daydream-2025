extends Node2D

@onready var line= $Line2D
@onready var end=$Node2D

func _ready() -> void:
	pass
func _process(delta: float) -> void:
	var points=PackedVector2Array([position,end.position])
	line.points=points
	
