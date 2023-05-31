extends CharacterBody3D
var direction = Vector3()

var colors = [Color.DARK_RED, Color.BLACK, Color.DEEP_PINK]


var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var shape = $plaseholder.get("surface_material_override/0").duplicate()

func _ready():
	direction.x = 3
	
	
	$plaseholder.set("surface_material_override/0", shape)
	pass 

func _physics_process(delta):
	direction = direction.rotated(Vector3.UP, .01 )
	
	
	#position += delta * direction 
#testing




#rotate on spacebar
	if Input.is_action_just_pressed("ui_accept"):
		
		rotation.y = rotation.y + deg_to_rad(15)
	rotation.y = rotation.y + .008







		
#testing

func _on_input_event(camera, event, mouse_position_on_surface, normal, shape_idx):
	
	if Input.is_action_pressed("left_aclick"):
		position.x = mouse_position_on_surface.x
		position.z = mouse_position_on_surface.z
		#print(normal)
	#shape.albedo_color = colors[randi()%3]
	pass


func _on_mouse_entered():
	shape.albedo_color = colors[1]


func _on_mouse_exited():
	shape.albedo_color = colors[0]
