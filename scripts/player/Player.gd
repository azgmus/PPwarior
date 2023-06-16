extends CharacterBody3D


var health = 100


const SPEED = 10.0
const JUMP_VELOCITY = 4.5

var direction = Vector3.ZERO
var weight = 100 # пока ничего не делает, план имплементировать приоритет и силу кто кого толкает при столкновении

@onready var model = $player_model
@onready var model_anim_player = $player_model/AnimationPlayer
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
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	input_dir = input_dir.rotated(-0.785398)
	
	direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)


	#model.look_at(transform.origin - velocity, Vector3.UP)
	
	#model.look_at(get_mouse_position_on_floor(), Vector3.UP)
	#model.rotation.x = 0
	#model.rotation = get_look_direction_normal()
	
	#print(get_look_direction_normal())
	
	#print(model.rotation)
	
	
	
	
	
	#####testing area


	
	
	
	
	if Input.is_action_just_pressed("jump"):
		var collision = get_collision_on_cursor(1)
		if collision and collision.collider.has_method('take_damage'):
			target_atack(collision.collider)
		#print(get_collision_on_cursor(1))
		
		
		#print(get_look_direction_normal())
		#print(model.get_child(1))
		
		#velocity.y = JUMP_VELOCITY
		pass
	
	
	
	

	####testing area
	move_and_slide()

	set_process_unhandled_input(true)


func get_look_direction_normal():
	var normal_to_cursor = (get_mouse_position_on_floor() - position).normalized()
	var loock_direction_normal = Vector3(normal_to_cursor.x, 0, normal_to_cursor.z) #changing y causes normal to go up and down
	return loock_direction_normal


func get_normal_to_target(target):
	var target_position = target.position 
	target_position.y = 0
	var normal_to_target = (target_position - position).normalized()
	normal_to_target = Vector3(normal_to_target.x, 0, normal_to_target.z) #changing y causes normal to go up and down
	return normal_to_target


func get_collision_on_cursor(layer):
	
	var spaceState = get_world_3d().direct_space_state
	
	
	
	var mousePos = get_viewport().get_mouse_position()
	var camera = get_tree().root.get_camera_3d()
	var rayOrigin = camera.project_ray_origin(mousePos)
	var rayEnd = rayOrigin + camera.project_ray_normal(mousePos) * 2011
	
	
	
	var rayParams = PhysicsRayQueryParameters3D.create(rayOrigin, rayEnd, layer) #third parameter is collision layer(hover over layer in collision tab to see needed value)
	rayParams.collide_with_areas = true
	var rayArray = spaceState.intersect_ray(rayParams)
	
	
	print(rayArray)
	return rayArray



func target_atack(target):
	stick_to_target(target)
	
	if target.has_method("take_damage"):
		model_anim_player.play("idle") #чтобы следующая анимация начиналась сначала
		model_anim_player.play('charge_Godot_Chan_Stealth')
		
		target.take_damage(1)
		
		
		

func stick_to_target(target):
	var stick_position = target.position
	stick_position.y = 0
	position = stick_position - get_normal_to_target(target) * 2
	
	
	
	
func get_mouse_position_on_floor():

	var floor_collision = get_collision_on_cursor(8)
	
	
	if floor_collision.has("position"):
		return floor_collision["position"]
		
	return Vector3()
	
	
	

