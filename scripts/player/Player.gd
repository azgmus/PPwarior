extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5


var weight = 100 # пока ничего не делает, план имплементировать приоритет и силу кто кого толкает при столкновении

@onready var model = $player_model
@onready var raycast = $RayCast3D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _ready():

	pass


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	#Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	input_dir = input_dir.rotated(-0.785398)
	
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)


	#model.look_at(transform.origin - velocity, Vector3.UP)
	model.look_at(ScreenPointToRay(), Vector3.UP)
	
	
	
	
	#####testing area

	





	####testing area
	move_and_slide()






func _on_projectile_2_body_entered(body):
	#print(body)
	pass

func ScreenPointToRay():
	var penis = $"../Projectile"
	
	
	var spaceState = get_world_3d().direct_space_state
	
	var mousePos = get_viewport().get_mouse_position()
	var camera = get_tree().root.get_camera_3d()
	var rayOrigin = camera.project_ray_origin(mousePos)
	var rayEnd = rayOrigin + camera.project_ray_normal(mousePos) * 2011
	var rayParams = PhysicsRayQueryParameters3D.create(rayOrigin, rayEnd, 8) #third parameter is collision layer(hover over layer in collision tab to see needed value)
	var rayArray = spaceState.intersect_ray(rayParams)
	if rayArray.has("position"):
		
		
		#penis.position = rayArray["position"]
		
		
		#print(rayEnd)
		return rayArray["position"]

	return Vector3()
