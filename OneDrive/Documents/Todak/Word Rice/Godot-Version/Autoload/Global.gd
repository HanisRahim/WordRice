extends Node

# Game State
var current_score: int = 0
var wrong_clicks: int = 0
var tasks_completed: int = 0
var completed_tasks: Array = []
var current_task: String = ""
var task_start_time: float = 0.0
var time_left: float = 30.0
var is_game_active: bool = false

# Leaderboard
const LEADERBOARD_SIZE = 10
var leaderboard: Array = []

# Word Dictionary - 4-letter words
var word_dictionary: Array = [
	"WORD", "RICE", "GAME", "PLAY", "TIME", "LOVE", "HATE", "LIKE", "MAKE", "TAKE",
	"COME", "SOME", "THEM", "THEN", "THAN", "THAT", "THIS", "WITH", "HAVE", "FROM",
	"THEY", "BEEN", "WERE", "WILL", "YOUR", "MORE", "WHEN", "WORK", "ALSO", "WELL",
	"VERY", "YEAR", "BACK", "CALL", "CAME", "EACH", "EVEN", "FEEL", "FIND", "GIVE",
	"GOOD", "HAND", "HIGH", "KEEP", "LAST", "LEFT", "LIFE", "LIVE", "LONG", "LOOK",
	"MADE", "MANY", "MUST", "NAME", "NEED", "NEXT", "ONLY", "OPEN", "OVER", "PART",
	"REAL", "SAID", "SAME", "SEEM", "SHOW", "SIDE", "SUCH", "SURE", "TELL", "TURN",
	"USED", "WANT", "WAYS", "WEEK", "WENT", "WHAT", "WILD", "WISE", "ZERO", "ZONE"
]

func _ready():
	load_leaderboard()

func reset_game():
	current_score = 0
	wrong_clicks = 0
	tasks_completed = 0
	completed_tasks.clear()
	time_left = 30.0
	is_game_active = false

func start_new_task():
	word_dictionary.shuffle()
	current_task = word_dictionary[0]
	task_start_time = Time.get_ticks_msec() / 1000.0
	return current_task

func complete_task(time_taken: float) -> int:
	# Calculate score: 200 - (time × 25), minimum 30
	var task_score = int(200.0 - (time_taken * 25.0))
	task_score = max(30, task_score)
	
	completed_tasks.append({
		"word": current_task,
		"time": time_taken,
		"score": task_score
	})
	
	tasks_completed += 1
	current_score += task_score
	return task_score

func deduct_points():
	wrong_clicks += 1
	current_score = max(0, current_score - 20)

func is_top_ten() -> bool:
	if leaderboard.size() < LEADERBOARD_SIZE:
		return true
	return current_score > leaderboard[LEADERBOARD_SIZE - 1]["score"]

func add_to_leaderboard(player_name: String):
	if player_name.strip_edges() == "":
		player_name = "Rice"
	
	leaderboard.append({
		"name": player_name,
		"score": current_score,
		"date": Time.get_datetime_string_from_system()
	})
	
	leaderboard.sort_custom(func(a, b): return a["score"] > b["score"])
	
	if leaderboard.size() > LEADERBOARD_SIZE:
		leaderboard.resize(LEADERBOARD_SIZE)
	
	save_leaderboard()

func load_leaderboard():
	if FileAccess.file_exists("user://leaderboard.json"):
		var file = FileAccess.open("user://leaderboard.json", FileAccess.READ)
		var json = JSON.new()
		var parse_result = json.parse(file.get_as_text())
		file.close()
		
		if parse_result == OK:
			leaderboard = json.data
		else:
			leaderboard = []
	else:
		leaderboard = []

func save_leaderboard():
	var file = FileAccess.open("user://leaderboard.json", FileAccess.WRITE)
	file.store_string(JSON.stringify(leaderboard, "\t"))
	file.close()

func get_leaderboard() -> Array:
	return leaderboard

