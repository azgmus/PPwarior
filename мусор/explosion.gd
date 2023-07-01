extends Node3D

var radius = Vector3.ONE * 10
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if scale < radius:
		scale += Vector3.ONE * .1
	else:
		queue_free()
