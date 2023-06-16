extends Node3D

@onready var projectile = preload("res://projectile.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += delta * Vector3.FORWARD
	pass


func _on_timer_timeout():
	
	var projectile_instance = projectile.instantiate()
	projectile_instance.rotation = rotation
	projectile_instance.position = position
	get_parent().add_child(projectile_instance)
	
	
	
