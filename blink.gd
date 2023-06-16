extends Node3D
@onready var skill_user = get_parent()
var skill_user_animation
#@onready var skill_user_animation = skill_user.model.get_node("AnimationPlayer")

func _ready():
	#skill_user_animation = skill_user.model.get_node("AnimationPlayer")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("left_click"):
		#if skill_user_animation:
		#skill_user.model.get_node("AnimationPlayer").stop()
		#skill_user.position += skill_user.get_look_direction_normal() * 2
		
	
	



