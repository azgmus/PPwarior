extends CharacterBody3D

var SPEED = 10
var direction = Vector3.FORWARD
var health = 100

var player
var direction_to_player
var colors = [Color.DARK_RED, Color.BLACK, Color.DEEP_PINK]


var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var shape = $plaseholder.get("surface_material_override/0").duplicate()

@onready var health_label = $health_label


func _ready():
	get_player()
	if player:
		player.connect("test", on_test)
		print("%s set player(%s)"%[self.name, player.name])
	velocity.x = SPEED
	health_label.text = str(health)
	
	
	
	$plaseholder.set("surface_material_override/0", shape)
	pass 

func _physics_process(delta):
	#rotation.y = rotation.y + .008
	
	#direction = direction.rotated(Vector3.UP,.03)
	#rotate(Vector3.UP,.1)
	direction_to_player
	if player:
		#look_at(player.position)
		pass
		
	
	#velocity = direction
	#move_and_slide()
	pass
	
	
	#position += delta * direction 
#testing




#rotate on spacebar
	if Input.is_action_just_pressed("jump"):
		#print(self.position)
		#print(self.global_position)
		pass
	







		
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
	
	
	
func set_player(sended_player):
	if not sended_player:
		print("no player sent")
	player = sended_player
	
func get_player():
	
	get_tree().call_group("player", "send_reference", self)


func _on_timer_timeout():
	velocity.x *= -1

func on_test(textik):
	health_label.text = textik
	print("%s got on_test signal"%[name])
