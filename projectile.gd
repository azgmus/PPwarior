extends Area3D
var player
var islerp = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	scale = Vector3.ONE * .4
	get_player()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("left_click"):
		islerp *= -1
	if Input.is_action_pressed("jump"):
		var tween = get_tree().create_tween()
		
		if islerp == 1:
			position = lerp(position, player.get_mouse_position_on_floor(), .1)
		else: 
			tween.set_ease(Tween.EASE_IN_OUT)
			tween.set_trans(Tween.TRANS_EXPO)
			tween.tween_property(self, "position", player.get_mouse_position_on_floor(), 1)
		
		#position = player.position
	
	if Input.is_action_pressed("left_click"):
		
		rotate(Vector3.UP, .004)
	
	
	


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


func _on_timer_timeout():
	queue_free()
