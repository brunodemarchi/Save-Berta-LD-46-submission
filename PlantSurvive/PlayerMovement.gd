extends KinematicBody2D

const GRAVITY = 60
var speed = 500
var jump_force = 1200
var velocity = Vector2()
var flipped = false
var jump = false
var is_crouching = false
onready var initial_scale_x = scale.x
onready var initial_berta_position_y = $BertaCollider.position.y

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


func _physics_process(delta):
	get_input()
	velocity.y += GRAVITY
	move_and_slide(velocity, Vector2(0, -1))	
	animate()


func get_input():
	if(Input.is_action_pressed("crouch")):
		is_crouching = true
	else:
		is_crouching = false
	
	if(Input.is_action_pressed('left')):
		if(!flipped):
			flipped = true
			flip_sprite()							
		velocity.x = -1
	elif(Input.is_action_pressed('right')):			
		if(flipped):
			flipped = false
			flip_sprite()		
		velocity.x = 1
	else:
		velocity.x = 0
	
	if(Input.is_action_just_pressed('jump')):
		jump()
	velocity.x = velocity.x * speed


func jump():
	if(is_on_floor()):
		velocity.y = -jump_force

func flip_sprite():
	scale.x = scale.x * -1

func animate():	
	if(is_on_floor()):
		if(is_crouching):
			$playerSprite.play("crouching")
			$BertaCollider.position.y = initial_berta_position_y + 80			
		else: 
			$playerSprite.play("default")
			$BertaCollider.position.y = initial_berta_position_y
	else: 
		$playerSprite.play("jumping")

