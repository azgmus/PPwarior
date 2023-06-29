extends Node3D
@onready var skill_user = get_parent()

@onready var distance_visualizer = $distance_visualizer
var distance = 5

@onready var skill_user_animation
@onready var cursor = $distance_visualizer/target
@onready var reachable_target = $distance_visualizer/reachable_target


func _ready():
	#skill_user_animation = skill_user.model.get_node("AnimationPlayer")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	
	
	
	
	
	
	if Input.is_action_pressed("left_click"):
		pass
	if Input.is_action_just_released("left_click"):
		
		skill_user_animation = skill_user.model.get_node("AnimationPlayer")
		if skill_user_animation:
			skill_user.model.get_node("AnimationPlayer").stop()
			skill_user.position += skill_user.get_look_direction_normal() * distance_visualizer.scale.z
		
	
	
#TODO эта хуйня 100 процентов приведет к проблемам, переделать НЕ ДЕРГАТЬ МЕТОДЫ ИГРОКА
	cursor.global_position = skill_user.get_attack_point()
	if Vector3.ZERO.distance_to(cursor.position) > distance:
		reachable_target.position = skill_user.get_normal_to_target(cursor) * distance
	else:
		reachable_target.position = cursor.position
	print(skill_user.global_position.distance_to(skill_user.get_attack_point()))
	#TODO эта хуйня 100 процентов приведет к проблемам, переделать


