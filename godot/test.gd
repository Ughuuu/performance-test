extends Node2D

@export var label: Label

var test_node := PerformanceTestNodeRust.new()
var summator_node := Summator.new()
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for i in 1000000:
		summator_node.add(1)
		#test_node.noop()
	label.text = str(Engine.get_frames_per_second())
