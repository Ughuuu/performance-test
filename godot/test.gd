extends Node2D

@export var label: Label

var test_node := PerformanceTestNodeRust.new()
var summator_node := Summator.new()
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	test_node.panic_func()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var callable := print123
	test_node.set_callable(callable)
	#summator_node.set_callable(callable)
	var time_start := Time.get_ticks_msec()
	for i in 1000000:
		#summator_node.noop()
		#summator_node.call_callable()
		#PerformanceTestNodeRust.noop()
		test_node.noop_binded()
		#test_node.call()
		#callable.callv([])
		#noop()
		pass
	label.text = str(Time.get_ticks_msec() - time_start)

func noop():
	pass

func print123():
	pass
