extends Node2D

const offsetY = -100
onready var spawn_start = get_node("SpawnStart")
onready var spawn_end = get_node("SpawnEnd")
onready var droplet = get_node("Droplet")
var rng = RandomNumberGenerator.new()
var droplet_width

# Called when the node enters the scene tree for the first time.
func _ready():
	droplet_width = droplet.get_node("droplet").texture.get_size().x
	spawn()	


func spawn():
	var spawnPositionX = rng.randi_range(spawn_start.position.x, spawn_end.position.x)
	droplet.position = Vector2(spawnPositionX + droplet_width/2, offsetY)
	
