extends CharacterBody3D

var SPEED = 10
var direction = Vector3.FORWARD
var health = 100

var player
var direction_to_player
var colors = [Color.DARK_RED, Color.BLACK, Color.DEEP_PINK]


var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


@onready var health_label = $health_label
@onready var model = $dummyModel2

func _ready():
	get_player()
	if player:
		player.connect("test", on_test)
		print("%s set player(%s)"%[self.name, player.name])
	
	health_label.text = str(health)
	
	
	
	
	pass 

func _physics_process(delta):
	velocity = -global_transform.basis.z * .1
	velocity.y = -3
	move_and_slide()
	look_at(player.position)
	rotation.x = 0
	#direction = direction.rotated(Vector3.UP,.03)
	#rotate(Vector3.UP,.1)

	if player:
		
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
	model.animation_player.play("stager")
	update_health(health - damage)
	
	
func _on_input_event(camera, event, mouse_position_on_surface, normal, shape_idx):
	
	
	
	if mouse_position_on_surface:
		pass
			
	
		
		
		
		#print(event)
		#print(camera)
	#shape.albedo_color = colors[randi()%3]
	pass


func get_mash():
	return $dummyModel2

func _on_mouse_entered():
	
	pass
	


func _on_mouse_exited():
	pass
	
	
	
func set_player(sended_player): #вызывает игрок присылает ссылку на себя
	if not sended_player:
		print("no player sent")
	player = sended_player
	
func get_player():
	
	get_tree().call_group("player", "send_reference", self)


func _on_timer_timeout():
	pass

func on_test():
	
	print("%s got on_test signal"%[name])


func _on_area_3d_area_entered(area):
	take_damage(10)
	print("area %s entered in %s" % [area.name, self.name])
