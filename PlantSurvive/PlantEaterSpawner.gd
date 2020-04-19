extends Node2D

const offsetX = 400
onready var spawn_end = get_node("SpawnEnd")
onready var spawn_middle = get_node("SpawnMiddle")
onready var plant_eater = get_node("PlantEater")
var rng = RandomNumberGenerator.new()
var plant_eater_width

# Called when the node enters the scene tree for the first time.
func _ready():
	plant_eater_width = plant_eater.get_node("evil_plant_eater").texture.get_size().x
	spawn()	


func spawn():
	Global.increase_speed()
	plant_eater.SPEED = Global.plant_eater_speed
	var options = [spawn_end.position, spawn_middle.position]
	var spawnPosition = options[rng.randi() % options.size()] 
	plant_eater.position = Vector2(spawnPosition.x + offsetX, spawnPosition.y)
	
