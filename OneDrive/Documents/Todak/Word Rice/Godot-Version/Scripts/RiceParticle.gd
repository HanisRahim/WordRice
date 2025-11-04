extends Node2D

var velocity: Vector2 = Vector2.ZERO
var rotation_speed: float = 0.0
var lifetime: float = 1.6
var gravity: float = 400.0
var air_resistance: float = 0.98

@onready var sprite: ColorRect = $Sprite

func _ready():
	# Setup rice grain appearance
	sprite.size = Vector2(16, 24)
	sprite.position = -sprite.size / 2
	
	# Gradient for rice grain look
	var gradient = Gradient.new()
	gradient.add_point(0.0, Color("fffef0"))
	gradient.add_point(0.5, Color("f5f5dc"))
	gradient.add_point(1.0, Color("e8e8d0"))
	
	# Random rotation speed
	rotation_speed = randf_range(-5, 5)
	
	# Random slight size variation
	scale = Vector2.ONE * randf_range(0.9, 1.1)
	
	# Auto-remove after lifetime
	get_tree().create_timer(lifetime).timeout.connect(queue_free)

func _process(delta):
	# Apply physics
	velocity.y += gravity * delta
	velocity *= air_resistance
	
	# Update position
	position += velocity * delta
	
	# Rotate
	rotation += rotation_speed * delta
	
	# Fade out over time
	var progress = get_tree().create_timer(0).timeout.is_connected(queue_free)
	modulate.a = 1.0 - (1.0 / lifetime) * get_tree().create_timer(0).time_left

