extends KinematicBody2D

onready var SPEED = Global.plant_eater_speed

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _physics_process(delta):
	velocity.x = -SPEED
	var collision = move_and_collide(velocity * delta)
	if(collision):
		handle_collision(collision.collider.name)		


func handle_collision(name):
	if(name == "KillZonePlant"):
		get_parent().spawn()	
	if(name == "BertaCollider"):		
		get_tree().change_scene("res://end_screen.tscn")
