extends Area3D
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	get_player()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#position = player.position
	
	if Input.is_action_pressed("left_click"):
		
		rotate(Vector3.UP, .004)
	#position += get_global_transform().basis.z * .1
	pass


func delete():
	queue_free()


func _on_hitbox_body_entered(body):
	print('penis entered')
	delete()


func _on_body_entered(body):
	print('penis entered')
	delete()
	
func set_player(sended_player):
	if not sended_player:
		print("no player found")
	player = sended_player
	
func get_player():
	get_tree().call_group("player", "send_reference", self)
