extends Node3D
@onready var skill_user = get_parent()

@onready var distance_visualizer = $distance_visualizer
var distance = 5

@onready var skill_user_animation
@onready var cursor = $distance_visualizer/cursor
@onready var reachable_target = $distance_visualizer/reachable_target



@onready var projectile = preload("res://мусор/explosion.tscn")



func _ready():
	#skill_user_animation = skill_user.model.get_node("AnimationPlayer")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	
	
	
	
	
	
	if Input.is_action_pressed("left_click"):
		
		
		cursor.global_position = skill_user.get_attack_point()
		
		if Vector3.ZERO.distance_to(cursor.position) > distance:
			reachable_target.position = skill_user.get_normal_to_target(cursor) * distance
		else:
			reachable_target.global_position = cursor.global_position
		
		
			
			
			
	if Input.is_action_just_released("left_click"):
		
		skill_user_animation = skill_user.model.get_node("AnimationPlayer")
		if skill_user_animation:
			skill_user.model.get_node("AnimationPlayer").play("release_Godot_Chan_Stealth")
			#skill_user.position += skill_user.get_look_direction_normal() * distance_visualizer.scale.z
			
			
			
		var projectile_instance = projectile.instantiate()
		get_tree().root.get_child(0).add_child(projectile_instance)
		projectile_instance.rotation = rotation
		projectile_instance.global_position = reachable_target.global_position
		
	
	


