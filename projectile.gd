extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	#rotate(Vector3(0,1,0).normalized(), .3)
	#position += get_global_transform().basis.z * .1
	pass


func delete():
	queue_free()


func _on_hitbox_body_entered(body):
	print('penis entered')
	delete()


func _on_body_entered(body):
	print('penis entered')
	delete()
