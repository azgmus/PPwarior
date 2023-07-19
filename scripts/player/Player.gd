extends CharacterBody3D

signal test
var health = 100


var SPEED = 10.0
const acceleration = .05
const decceleration = .05
const JUMP_VELOCITY = 4.5

var direction = Vector3.ZERO
var mouse_position = Vector3.ZERO
var weight = 100 # пока ничего не делает, план имплементировать приоритет и силу кто кого толкает при столкновении

@onready var model = $player_model
@onready var model_anim_player = $player_model/AnimationPlayer
@onready var loock_ray = $RayCast3D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _ready():

	pass
	

func _physics_process(delta):
	mouse_position = get_mouse_position_on_floor()
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	#Handle Jump.
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	input_dir = input_dir.rotated(-0.785398)
	
	direction = (Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	acceleration
	var a
	var b
	#if signf(a) != signf or a > 0 and b < 0:

	
	movement3(delta)
	
	
	
	
	
	
	
	
	#model.look_at(transform.origin - velocity, Vector3.UP)
	if Input.is_action_just_pressed("left_click"):
		SPEED = 4
	if Input.is_action_just_released("left_click"):
		SPEED = 10
	
	
	if Input.is_action_pressed("left_click"):
		model.look_at(get_mouse_position_on_floor(), Vector3.UP)
		loock_ray.target_position = get_look_direction_normal() * 5
	else:
		if direction != Vector3.ZERO:
			model.look_at(position + direction, Vector3.UP)
			loock_ray.target_position = direction * 5
	model.rotation.x = 0
	print(get_mouse_position_on_floor())
	#model.rotation = get_look_direction_normal()
	
	#print(get_look_direction_normal())
	
	#print(model.rotation)
	
	
	
	
	
	#####testing area


	
	
	
	
	if Input.is_action_just_pressed("jump"):
		var collision = get_collision_on_cursor(1)
		emit_signal("test")#enemy listening
		
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


func movement1():
	if direction.x and !(direction.x < 0 and velocity.x > 0 or direction.x > 0 and velocity.x < 0) :
		velocity.x = lerp(velocity.x, SPEED * direction.x, acceleration)
		
	else:
		velocity.x = lerp(velocity.x, 0.0, decceleration)
		
	if direction.z and !(direction.z < 0 and velocity.z > 0 or direction.z > 0 and velocity.z < 0):
		
		velocity.z = lerp(velocity.z, SPEED * direction.z, acceleration)
	else:
		
		velocity.z = lerp(velocity.z, 0.0, decceleration)
	if velocity.z == 0:
		print("penis")
	
	
	if abs(velocity.z) < .5:
		velocity.z = 0
	if abs(velocity.x) < .5:
		velocity.x = 0
	print(velocity)
	print(direction)
	
	
	
	
	#______________________________________________________________________________
	
	
	
	
func movement2():
	if direction.x and (signf(velocity.x) == signf(direction.x) or velocity.x == 0) :
		velocity.x = lerp(velocity.x, SPEED * direction.x, acceleration)
		
		
	else:
		if !direction.x:
			
			velocity.x = lerp(velocity.x, 0.0, decceleration)
		else:
			velocity.x = lerp(velocity.x, 0.0, decceleration )
		
	if direction.z and (signf(velocity.z) == signf(direction.z) or velocity.z == 0):
		
		velocity.z = lerp(velocity.z, SPEED * direction.z, acceleration)
	else:
		if !direction.z:
			
			velocity.z = lerp(velocity.z, 0.0, decceleration)
		else:
			velocity.z = lerp(velocity.z, 0.0, decceleration )
	
	if abs(velocity.z) < 0.1:
		velocity.z = 0
	if abs(velocity.x) < 0.1:
		velocity.x = 0
	print(velocity)
	


func movement3(delta):
	
	#var tween = get_tree().create_tween()
	#tween.set_ease(Tween.EASE_IN_OUT)
	#tween.set_trans(Tween.TRANS_EXPO)
	#tween.tween_property(self, "velocity", SPEED * direction, .1)
	print(velocity)
	#if direction:  
	velocity = lerp(velocity, direction * SPEED, .2) 
		



func get_look_direction_normal():
	var normal_to_cursor = (mouse_position - position).normalized()
	var loock_direction_normal = Vector3(normal_to_cursor.x, 0, normal_to_cursor.z) #changing y causes normal to go up and down
	return loock_direction_normal


func get_normal_to_target(target):
	var target_position = target.global_position
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
	
	
	#print(rayArray)
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
		var result = floor_collision["position"]
		result.y = 0
		
		return result
		
	return Vector3()
	
	


func get_attack_point():  #возвращает поинт на  земле, потом будут расчеты основанные на дальности, типе скилла и тд
	
	return get_mouse_position_on_floor()

func send_reference(asker):#кто то зовет этот метод через группу player
	asker.set_player(self)
