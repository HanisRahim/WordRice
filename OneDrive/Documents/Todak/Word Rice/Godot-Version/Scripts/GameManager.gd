extends Node2D

# UI Elements
@onready var timer_label: Label = $UI/TimerLabel
@onready var score_label: Label = $UI/ScoreLabel
@onready var progress_bar: ProgressBar = $UI/ProgressBar
@onready var task_display: HBoxContainer = $UI/TaskDisplay
@onready var letter_pool: Node2D = $LetterPool
@onready var rice_particles: Node2D = $RiceParticles

# Task slots
var task_slots: Array = []
var selected_letters: Array = []
var letter_tiles: Array = []

# Preload scenes
var LetterTileScene = preload("res://Scenes/LetterTile.tscn")
var RiceParticleScene = preload("res://Scenes/RiceParticle.tscn")

# Game settings
const GAME_TIME = 30.0
const POOL_TOP = 280
const POOL_BOTTOM_OFFSET = 280
const POOL_LEFT = 200
const POOL_RIGHT_OFFSET = 200
const TILE_PADDING = 20

func _ready():
	setup_task_display()
	start_game()

func _process(delta):
	if Global.is_game_active:
		update_timer(delta)

func start_game():
	Global.reset_game()
	Global.is_game_active = true
	generate_new_task()
	update_ui()

func setup_task_display():
	# Create 4 task slots
	for i in range(4):
		var slot = ColorRect.new()
		slot.custom_minimum_size = Vector2(70, 70)
		slot.color = Color("b0a090")
		
		var label = Label.new()
		label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		label.add_theme_font_size_override("font_size", 38)
		label.add_theme_color_override("font_color", Color("6d5d4d"))
		slot.add_child(label)
		
		task_display.add_child(slot)
		task_slots.append({"slot": slot, "label": label, "filled": false})

func generate_new_task():
	var task = Global.start_new_task()
	
	# Display task in slots
	for i in range(4):
		task_slots[i]["label"].text = task[i]
		task_slots[i]["filled"] = false
		task_slots[i]["slot"].color = Color("b0a090")
	
	# Clear previous selections
	selected_letters.clear()
	
	# Spawn letter tiles
	spawn_letter_tiles(task)

func spawn_letter_tiles(task: String):
	# Clear existing tiles
	for tile in letter_tiles:
		tile.queue_free()
	letter_tiles.clear()
	
	# Create letter array (4 correct + 8 random)
	var letters = []
	for i in range(4):
		letters.append(task[i])
	
	# Add 8 random letters
	var all_letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	for i in range(8):
		letters.append(all_letters[randi() % all_letters.length()])
	
	letters.shuffle()
	
	# Spawn tiles with collision detection
	var positions = []
	var pool_area = get_viewport_rect().size
	
	for letter in letters:
		var tile = LetterTileScene.instantiate()
		tile.letter = letter
		
		# Find non-overlapping position
		var valid_position = false
		var attempts = 0
		var pos = Vector2.ZERO
		
		while not valid_position and attempts < 100:
			pos.x = randf_range(POOL_LEFT, pool_area.x - POOL_RIGHT_OFFSET)
			pos.y = randf_range(POOL_TOP, pool_area.y - POOL_BOTTOM_OFFSET)
			
			valid_position = true
			for existing_pos in positions:
				if pos.distance_to(existing_pos) < (80 + TILE_PADDING):
					valid_position = false
					break
			
			attempts += 1
		
		positions.append(pos)
		tile.position = pos
		tile.tile_clicked.connect(_on_letter_tile_clicked)
		
		letter_pool.add_child(tile)
		letter_tiles.append(tile)

func _on_letter_tile_clicked(tile: LetterTile, is_correct: bool):
	if selected_letters.size() >= 4:
		return
	
	# Check if letter is correct
	var task_letters = Global.current_task.split("")
	var is_valid = false
	var target_slot_idx = -1
	
	for i in range(4):
		if task_letters[i] == tile.letter and not task_slots[i]["filled"]:
			is_valid = true
			target_slot_idx = i
			break
	
	if is_valid:
		# Correct letter
		play_correct_sound()
		spawn_rice_at_position(tile.global_position, 6)
		
		tile.mark_as_selected()
		selected_letters.append(tile)
		
		# Fly to slot
		var slot_pos = task_slots[target_slot_idx]["slot"].global_position
		slot_pos += Vector2(35, 35)  # Center of slot
		tile.fly_to_slot(slot_pos)
		
		# Mark slot as filled
		task_slots[target_slot_idx]["filled"] = true
		task_slots[target_slot_idx]["slot"].color = Color("90ee90")
		
		# Check if task complete
		if selected_letters.size() == 4:
			await get_tree().create_timer(0.7).timeout
			complete_task()
	else:
		# Wrong letter
		play_wrong_sound()
		tile.play_shake_animation()
		Global.deduct_points()
		update_ui()

func complete_task():
	play_yay_sound()
	spawn_rice_burst()
	
	# Calculate time taken
	var time_taken = (Time.get_ticks_msec() / 1000.0) - Global.task_start_time
	var score = Global.complete_task(time_taken)
	
	update_ui()
	
	# Generate new task
	await get_tree().create_timer(0.8).timeout
	generate_new_task()

func spawn_rice_at_position(pos: Vector2, count: int):
	for i in range(count):
		var particle = RiceParticleScene.instantiate()
		particle.position = pos
		var angle = (TAU * i) / count + randf_range(-0.25, 0.25)
		particle.velocity = Vector2(cos(angle), sin(angle)) * randf_range(150, 250)
		particle.velocity.y -= 100  # Upward bias
		rice_particles.add_child(particle)

func spawn_rice_burst():
	var center = task_display.global_position + task_display.size / 2
	for i in range(25):
		var particle = RiceParticleScene.instantiate()
		particle.position = center
		var angle = (TAU * i) / 25 + randf_range(-0.2, 0.2)
		particle.velocity = Vector2(cos(angle), sin(angle)) * randf_range(300, 600)
		particle.velocity.y -= 150  # Strong upward explosion
		rice_particles.add_child(particle)

func update_timer(delta):
	Global.time_left -= delta
	
	if Global.time_left <= 0:
		Global.time_left = 0
		Global.is_game_active = false
		end_game()
	
	update_ui()

func update_ui():
	# Timer
	var minutes = int(Global.time_left) / 60
	var seconds = int(Global.time_left) % 60
	timer_label.text = "%d:%02d" % [minutes, seconds]
	
	# Progress bar
	progress_bar.value = (Global.time_left / GAME_TIME) * 100
	
	# Score
	score_label.text = "%04d" % Global.current_score

func end_game():
	get_tree().change_scene_to_file("res://Scenes/ScoreScreen.tscn")

func play_correct_sound():
	# Create simple beep with AudioStreamGenerator or play sound file
	pass

func play_wrong_sound():
	pass

func play_yay_sound():
	pass

