extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():	
	text = str('Water Needed: \n ', 0 ,' / ', Global.tiers[Global.current_tier])
	Global.connect("water_berta", self, "_updateText")
	

func _updateText():
	if(Global.streak_bonus):
		text = str('Water Needed: STREAK BONUS x2 \n ', Global.berta_water_count ,' / ', Global.berta_water_needed)	
	else: 
		text = str('Water Needed: \n ', Global.berta_water_count ,' / ', Global.berta_water_needed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
