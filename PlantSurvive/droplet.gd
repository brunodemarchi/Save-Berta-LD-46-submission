extends KinematicBody2D

const GRAVITY = 500

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _physics_process(delta):
	
	velocity.y = GRAVITY
	var collision = move_and_collide(velocity * delta)
	if(collision):
		handle_collision(collision.collider.name)		


func handle_collision(name):	
	if(name == "KillZone"):
		Global.miss_water_berta()
		get_parent().spawn()	
	if(name == "BertaCollider"):
		Global.water_berta()
		get_parent().spawn()
