extends Control

@onready var instructions_text: RichTextLabel = $Panel/VBox/InstructionsText
@onready var countdown_label: Label = $Panel/VBox/CountdownLabel

var countdown: int = 5

func _ready():
	setup_instructions()
	start_countdown()

func setup_instructions():
	instructions_text.text = """[center][color=gold][font_size=42]HOW TO PLAY[/font_size][/color][/center]

[color=white]🎯 [b]Goal:[/b] Complete as many words as possible in 30 seconds!

📝 [b]Gameplay:[/b]
• You'll see a 4-letter word (greyed out) at the bottom
• Click the correct letters from the pool to spell the word
• Letters can be clicked in any order
• Wrong letters will shake - try again!

⚡ [b]Scoring:[/b] Faster completion = Higher points!

🍚 [b]Watch for rice particle effects when you're right![/b][/color]"""

func start_countdown():
	countdown_label.text = str(countdown)
	countdown_label.add_theme_font_size_override("font_size", 72)
	countdown_label.add_theme_color_override("font_color", Color("ffd700"))
	
	var timer = Timer.new()
	timer.wait_time = 1.0
	timer.timeout.connect(_on_countdown_tick)
	add_child(timer)
	timer.start()

func _on_countdown_tick():
	countdown -= 1
	
	if countdown > 0:
		countdown_label.text = str(countdown)
		# Pulse animation
		var tween = create_tween()
		tween.tween_property(countdown_label, "scale", Vector2(1.2, 1.2), 0.2)
		tween.tween_property(countdown_label, "scale", Vector2(1.0, 1.0), 0.3)
	else:
		countdown_label.text = "GO!"
		var tween = create_tween()
		tween.tween_property(countdown_label, "scale", Vector2(1.5, 1.5), 0.3)
		tween.finished.connect(func():
			await get_tree().create_timer(0.5).timeout
			get_tree().change_scene_to_file("res://Scenes/GameScene.tscn")
		)

