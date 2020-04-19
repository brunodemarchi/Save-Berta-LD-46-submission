extends Sprite
var bronze = load("res://assets/win_screen_bronze.png")
var silver = load("res://assets/win_screen_silver.png")
var gold = load("res://assets/win_screen_gold.png")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if(name == "win_screen"):
		var water_needed = Global.berta_water_needed
		if(water_needed == 15):
			set_texture(bronze)
		elif(water_needed == 30):			
			set_texture(silver)
		elif(water_needed == 50):
			set_texture(gold)
	
	pass # Replace with function body.



func _process(_delta):
	if(Input.is_action_just_pressed("restart")):		
		if(name == "win_screen"):
			Global.increaseDifficulty()
		get_tree().change_scene("res://MainScene.tscn")
