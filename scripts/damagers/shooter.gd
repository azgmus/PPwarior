extends Node3D
var count = 0
@onready var projectile = preload("res://projectile.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#rotate(Vector3(0,1,0).normalized(), .01)
	#position += get_global_transform().basis.z * .3
	pass


func _on_timer_timeout():
	if count <90000:
		count += 1
		var projectile_instance = projectile.instantiate()
		
		get_tree().root.get_child(0).add_child(projectile_instance)
		projectile_instance.rotation = rotation
		projectile_instance.global_position = global_position
		
	
	
	
