extends Node3D
var count = 0
@onready var projectile = preload("res://projectile.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotate(Vector3(0,1,0).normalized(), .01)
	position += get_global_transform().basis.z * .3
	pass


func _on_timer_timeout():
	if count <9:
		count += 1
		var projectile_instance = projectile.instantiate()
		projectile_instance.rotation = rotation
		projectile_instance.position = position
		get_parent().add_child(projectile_instance)
	
	
	
