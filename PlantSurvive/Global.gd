extends Node

signal water_berta
var plant_eater_speed = 450
var plant_eater_max_speed = 1600
var berta_water_count = 0
var tiers = [15,30,50]
var current_tier = 0
var berta_water_needed = tiers[current_tier]
var streak = 0
var streak_bonus = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func reset():
	plant_eater_speed = 450
	berta_water_count = 0
	streak = 0
	streak_bonus = false

func increase_speed():	
	plant_eater_speed = min(plant_eater_speed + 50, plant_eater_max_speed)
	
	
func water_berta():		
	berta_water_count += 1
	streak += 1
	
	if (streak == 5):
		streak_bonus = true
		
	if(streak > 5):
		berta_water_count += 1
	
	if(berta_water_count >= berta_water_needed):		
		get_tree().change_scene("res://win_screen.tscn")
	
	
	emit_signal("water_berta")


func miss_water_berta():	
	streak = 0
	streak_bonus = false	
	emit_signal("water_berta")

func increaseDifficulty():	
	current_tier = min(current_tier + 1, 2)	
	berta_water_needed = tiers[current_tier]
	
