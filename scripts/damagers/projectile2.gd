extends Area3D

var direction = Vector3()




# смерть при попадании 

# Called when the node enters the scene tree for the first time.
func _ready():
	direction.x = 3
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	direction = direction.rotated(Vector3.UP, .01 )
	position += delta * direction 
	#if body_entered:
	#	print('PP')
	pass
