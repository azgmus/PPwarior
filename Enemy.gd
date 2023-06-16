extends CharacterBody3D



var health = 100


var colors = [Color.DARK_RED, Color.BLACK, Color.DEEP_PINK]


var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var shape = $plaseholder.get("surface_material_override/0").duplicate()

@onready var health_label = $health_label


func _ready():
	health_label.text = str(health)
	
	
	
	$plaseholder.set("surface_material_override/0", shape)
	pass 

func _physics_process(delta):
	#rotation.y = rotation.y + .008
	pass
	
	
	#position += delta * direction 
#testing




#rotate on spacebar
	if Input.is_action_just_pressed("ui_accept"):
		pass
		#update_health(health - 10)
	







		
#testing



func update_health(new_health):
	health = new_health
	health_label.text = str(new_health)
	if health <= 0:
		queue_free()
	


func take_damage(damage):
	update_health(health - damage)
	
func _on_input_event(camera, event, mouse_position_on_surface, normal, shape_idx):
	
	
	
	if mouse_position_on_surface:
		pass
			
	if Input.is_action_pressed("left_click"):
		position.x = mouse_position_on_surface.x
		position.z = mouse_position_on_surface.z
		
		#print(event)
		#print(camera)
	#shape.albedo_color = colors[randi()%3]
	pass


func get_mash():
	return $plaseholder

func _on_mouse_entered():
	
	shape.albedo_color = colors[1]
	


func _on_mouse_exited():
	shape.albedo_color = colors[0]
	
