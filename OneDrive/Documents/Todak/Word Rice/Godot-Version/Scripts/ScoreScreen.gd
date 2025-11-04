extends Control

@onready var task_list: VBoxContainer = $Panel/VBox/TaskList
@onready var total_score_label: Label = $Panel/VBox/TotalScore
@onready var countdown_label: Label = $Panel/VBox/CountdownLabel
@onready var name_input_popup: Control = $NameInputPopup

var return_countdown: int = 8

func _ready():
	# Check if player made top 10
	if Global.current_score > 0 and Global.is_top_ten():
		show_name_input()
	else:
		show_score_screen()

func show_name_input():
	name_input_popup.visible = true
	var name_input: LineEdit = name_input_popup.get_node("Panel/VBox/NameInput")
	var submit_button: Button = name_input_popup.get_node("Panel/VBox/SubmitButton")
	var score_display: Label = name_input_popup.get_node("Panel/VBox/ScoreDisplay")
	
	score_display.text = str(Global.current_score)
	score_display.add_theme_font_size_override("font_size", 56)
	score_display.add_theme_color_override("font_color", Color("ffd700"))
	
	name_input.placeholder_text = "Rice"
	name_input.max_length = 15
	
	submit_button.pressed.connect(func():
		var player_name = name_input.text.strip_edges()
		if player_name == "":
			player_name = "Rice"
		Global.add_to_leaderboard(player_name)
		name_input_popup.visible = false
		show_score_screen()
	)
	
	name_input.text_submitted.connect(func(_text):
		submit_button.pressed.emit()
	)

func show_score_screen():
	name_input_popup.visible = false
	display_tasks()
	start_return_countdown()

func display_tasks():
	# Clear list
	for child in task_list.get_children():
		child.queue_free()
	
	# Title
	var header = Label.new()
	header.text = "GAME OVER!"
	header.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	header.add_theme_font_size_override("font_size", 42)
	header.add_theme_color_override("font_color", Color("ffd700"))
	task_list.add_child(header)
	
	# Add spacer
	var spacer1 = Control.new()
	spacer1.custom_minimum_size.y = 20
	task_list.add_child(spacer1)
	
	# Task entries
	if Global.completed_tasks.is_empty():
		var no_tasks = Label.new()
		no_tasks.text = "No tasks completed"
		no_tasks.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		no_tasks.add_theme_color_override("font_color", Color("b8b8b8"))
		task_list.add_child(no_tasks)
	else:
		for task in Global.completed_tasks:
			var entry = HBoxContainer.new()
			
			# Word
			var word_label = Label.new()
			word_label.text = task["word"]
			word_label.custom_minimum_size.x = 80
			word_label.add_theme_font_size_override("font_size", 22)
			word_label.add_theme_color_override("font_color", Color("fffef0"))
			entry.add_child(word_label)
			
			# Time
			var time_label = Label.new()
			time_label.text = "%.2fs" % task["time"]
			time_label.custom_minimum_size.x = 80
			time_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
			time_label.add_theme_font_size_override("font_size", 16)
			time_label.add_theme_color_override("font_color", Color("b8b8b8"))
			entry.add_child(time_label)
			
			# Score
			var score_label = Label.new()
			score_label.text = "+%d" % task["score"]
			score_label.custom_minimum_size.x = 80
			score_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
			score_label.add_theme_font_size_override("font_size", 20)
			score_label.add_theme_color_override("font_color", Color("ffd700"))
			entry.add_child(score_label)
			
			task_list.add_child(entry)
		
		# Penalty for wrong clicks
		if Global.wrong_clicks > 0:
			var penalty = HBoxContainer.new()
			
			var penalty_label = Label.new()
			penalty_label.text = "Wrong Letters (%dx)" % Global.wrong_clicks
			penalty_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			penalty_label.add_theme_font_size_override("font_size", 20)
			penalty_label.add_theme_color_override("font_color", Color("ff6b6b"))
			penalty.add_child(penalty_label)
			
			var penalty_score = Label.new()
			penalty_score.text = "-%d" % (Global.wrong_clicks * 20)
			penalty_score.custom_minimum_size.x = 80
			penalty_score.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
			penalty_score.add_theme_font_size_override("font_size", 20)
			penalty_score.add_theme_color_override("font_color", Color("ff6b6b"))
			penalty.add_child(penalty_score)
			
			task_list.add_child(penalty)
	
	# Add spacer
	var spacer2 = Control.new()
	spacer2.custom_minimum_size.y = 20
	task_list.add_child(spacer2)
	
	# Total score
	total_score_label.text = "TOTAL SCORE\n%d" % Global.current_score
	total_score_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	total_score_label.add_theme_font_size_override("font_size", 32)
	total_score_label.add_theme_color_override("font_color", Color("ffd700"))

func start_return_countdown():
	countdown_label.text = "Returning to menu in %d s" % return_countdown
	countdown_label.add_theme_font_size_override("font_size", 18)
	countdown_label.add_theme_color_override("font_color", Color("b8b8b8"))
	
	var timer = Timer.new()
	timer.wait_time = 1.0
	timer.timeout.connect(_on_return_countdown_tick)
	add_child(timer)
	timer.start()

func _on_return_countdown_tick():
	return_countdown -= 1
	countdown_label.text = "Returning to menu in %d s" % return_countdown
	
	if return_countdown <= 0:
		get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")

