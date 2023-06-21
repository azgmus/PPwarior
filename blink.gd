extends Node3D
@onready var skill_user = get_parent()

@onready var skill_user_animation

func _ready():
	#skill_user_animation = skill_user.model.get_node("AnimationPlayer")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("left_click"):
		skill_user_animation = skill_user.model.get_node("AnimationPlayer")
		if skill_user_animation:
			skill_user.model.get_node("AnimationPlayer").stop()
			skill_user.position += skill_user.get_look_direction_normal() * 2
		
	
	



