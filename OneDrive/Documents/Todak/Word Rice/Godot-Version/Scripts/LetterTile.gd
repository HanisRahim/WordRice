extends Area2D
class_name LetterTile

signal tile_clicked(tile: LetterTile, is_correct: bool)
signal tile_arrived_at_slot

@export var letter: String = "A"
@export var tile_size: Vector2 = Vector2(80, 80)

var is_selected: bool = false
var is_flying: bool = false
var target_slot_position: Vector2
var original_rotation: float

@onready var bg_rect: ColorRect = $Background
@onready var letter_label: Label = $LetterLabel
@onready var collision_shape: CollisionShape2D = $CollisionShape2D

# Colors
const COLOR_NORMAL = Color("fffef0")
const COLOR_SELECTED = Color("ffe87c")
const COLOR_BORDER = Color("8b7355")

func _ready():
	# Setup visual appearance
	setup_visual()
	
	# Connect signals
	input_event.connect(_on_input_event)
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	
	# Random rotation for natural look
	original_rotation = randf_range(-15, 15)
	rotation_degrees = original_rotation

func setup_visual():
	# Background
	bg_rect.size = tile_size
	bg_rect.position = -tile_size / 2
	bg_rect.color = COLOR_NORMAL
	
	# Add border
	var border = Line2D.new()
	border.width = 3
	border.default_color = COLOR_BORDER
	border.add_point(-tile_size / 2)
	border.add_point(Vector2(tile_size.x, -tile_size.y) / 2)
	border.add_point(tile_size / 2)
	border.add_point(Vector2(-tile_size.x, tile_size.y) / 2)
	border.add_point(-tile_size / 2)
	add_child(border)
	
	# Letter label
	letter_label.text = letter
	letter_label.add_theme_font_size_override("font_size", 42)
	letter_label.add_theme_color_override("font_color", Color("3d2817"))
	letter_label.position = -tile_size / 2
	letter_label.size = tile_size
	letter_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	letter_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	
	# Collision shape
	var rect_shape = RectangleShape2D.new()
	rect_shape.size = tile_size
	collision_shape.shape = rect_shape

func _on_input_event(_viewport, event: InputEvent, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if not is_selected and not is_flying:
			tile_clicked.emit(self, false)

func _on_mouse_entered():
	if not is_selected and not is_flying:
		scale = Vector2(1.1, 1.1)

func _on_mouse_exited():
	if not is_selected and not is_flying:
		scale = Vector2(1.0, 1.0)

func mark_as_selected():
	is_selected = true
	bg_rect.color = COLOR_SELECTED
	rotation_degrees = 0
	scale = Vector2(1.05, 1.05)

func play_shake_animation():
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_ELASTIC)
	tween.set_ease(Tween.EASE_OUT)
	
	var original_pos = position
	tween.tween_property(self, "position", original_pos + Vector2(-10, 0), 0.1)
	tween.tween_property(self, "position", original_pos + Vector2(10, 0), 0.1)
	tween.tween_property(self, "position", original_pos, 0.1)

func fly_to_slot(target_position: Vector2):
	is_flying = true
	target_slot_position = target_position
	
	var tween = create_tween()
	tween.set_parallel(true)
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.set_ease(Tween.EASE_IN_OUT)
	
	tween.tween_property(self, "position", target_position, 0.6)
	tween.tween_property(self, "rotation_degrees", 0, 0.6)
	tween.tween_property(self, "scale", Vector2(0.9, 0.9), 0.6)
	tween.tween_property(self, "modulate:a", 0.5, 0.6)
	
	tween.finished.connect(func():
		tile_arrived_at_slot.emit()
		visible = false
	)

func reset_tile():
	is_selected = false
	is_flying = false
	visible = true
	modulate.a = 1.0
	scale = Vector2(1.0, 1.0)
	rotation_degrees = original_rotation
	bg_rect.color = COLOR_NORMAL

