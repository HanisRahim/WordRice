extends Control

@onready var start_button: Button = $MenuContent/StartButton
@onready var leaderboard_list: VBoxContainer = $MenuContent/Leaderboard/LeaderboardList
@onready var title_label: Label = $MenuContent/Title

func _ready():
	setup_ui()
	display_leaderboard()
	start_button.pressed.connect(_on_start_button_pressed)

func setup_UI():
	# Title styling
	title_label.add_theme_font_size_override("font_size", 72)
	title_label.add_theme_color_override("font_color", Color("ffd700"))

func display_leaderboard():
	# Clear existing entries
	for child in leaderboard_list.get_children():
		child.queue_free()
	
	var leaderboard = Global.get_leaderboard()
	
	if leaderboard.is_empty():
		var no_scores = Label.new()
		no_scores.text = "No scores yet!"
		no_scores.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		no_scores.add_theme_color_override("font_color", Color("b8b8b8"))
		leaderboard_list.add_child(no_scores)
		return
	
	for i in range(leaderboard.size()):
		var entry = leaderboard[i]
		var entry_container = HBoxContainer.new()
		
		# Rank
		var rank_label = Label.new()
		rank_label.text = "#%d" % (i + 1)
		rank_label.custom_minimum_size.x = 50
		rank_label.add_theme_color_override("font_color", Color("ffd700"))
		rank_label.add_theme_font_size_override("font_size", 20)
		entry_container.add_child(rank_label)
		
		# Name
		var name_label = Label.new()
		name_label.text = entry["name"]
		name_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		name_label.add_theme_color_override("font_color", Color("fffef0"))
		name_label.add_theme_font_size_override("font_size", 20)
		entry_container.add_child(name_label)
		
		# Score
		var score_label = Label.new()
		score_label.text = str(entry["score"])
		score_label.custom_minimum_size.x = 100
		score_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		score_label.add_theme_color_override("font_color", Color("90ee90"))
		score_label.add_theme_font_size_override("font_size", 20)
		entry_container.add_child(score_label)
		
		# Styling for top 3
		if i < 3:
			var panel = PanelContainer.new()
			panel.add_theme_stylebox_override("panel", create_top3_style())
			panel.add_child(entry_container)
			leaderboard_list.add_child(panel)
		else:
			leaderboard_list.add_child(entry_container)

func create_top3_style() -> StyleBoxFlat:
	var style = StyleBoxFlat.new()
	style.bg_color = Color("ffd700", 0.2)
	style.border_color = Color("ffd700")
	style.border_width_left = 2
	style.border_width_right = 2
	style.border_width_top = 2
	style.border_width_bottom = 2
	style.corner_radius_top_left = 8
	style.corner_radius_top_right = 8
	style.corner_radius_bottom_left = 8
	style.corner_radius_bottom_right = 8
	return style

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/InstructionsPopup.tscn")

