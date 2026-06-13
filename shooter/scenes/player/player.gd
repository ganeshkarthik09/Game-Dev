extends CharacterBody2D 

signal laser
signal grenade

var can_laser : bool = true
var can_grenade : bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print('Started') 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	# 1. Get the input direction vector from your input map keys
	var direction = Input.get_vector("left","right","up","down")
	
	# 2. KEEP THE SNIPPET HERE!
	# Set the velocity vector (speed and direction)
	velocity = direction * 500
	
	# Move the player using Godot's internal physics engine calculations
	move_and_slide()
	
	# 3. Your weapon inputs stay right below the movement code
	if Input.is_action_pressed("Primary Action") and can_laser:
		can_laser = false
		$Timer.start()
		laser.emit()
	if Input.is_action_pressed("secondary action") and can_grenade:
		can_grenade = false
		$"GrenadeReload Timer".start()
		grenade.emit()


func _on_timer_timeout() -> void:
	#pass # Replace with function body.
	can_laser = true;



func _on_grenade_reload_timer_timeout() -> void:
	can_grenade = true
