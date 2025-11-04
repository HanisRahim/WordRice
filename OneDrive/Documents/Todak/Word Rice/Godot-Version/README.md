# Word Rice - Godot Version

A fast-paced 4-letter word puzzle game built with Godot 4.2+

![Word Rice](../HTML5-Version/assets/images/README.md)

## 🎮 Game Features

- **30-second timer** - Race against the clock!
- **Speed-based scoring** - Faster = more points
- **Physics-based rice particles** - Satisfying visual effects
- **Top 10 leaderboard** - Compete for high scores
- **Wrong letter penalties** - -20 points per mistake
- **Smooth animations** - Flying letters and particle explosions

## 📁 Project Structure

```
Godot-Version/
├── project.godot           # Main project file
├── Scenes/                 # Game scenes (.tscn files)
│   ├── MainMenu.tscn
│   ├── GameScene.tscn
│   ├── InstructionsPopup.tscn
│   ├── ScoreScreen.tscn
│   ├── LetterTile.tscn
│   └── RiceParticle.tscn
├── Scripts/                # GDScript files
│   ├── MainMenu.gd
│   ├── GameManager.gd
│   ├── LetterTile.gd
│   ├── RiceParticle.gd
│   ├── InstructionsPopup.gd
│   └── ScoreScreen.gd
├── Assets/                 # Game assets
│   ├── Fonts/
│   ├── Textures/
│   └── Sounds/
└── Autoload/               # Global singletons
    └── Global.gd           # Game state manager
```

## 🚀 How to Run

### 1. Install Godot
- Download Godot 4.2 or later from [godotengine.org](https://godotengine.org)
- Install and launch Godot

### 2. Open Project
- Click "Import" in Godot project manager
- Navigate to `Godot-Version` folder
- Select `project.godot`
- Click "Import & Edit"

### 3. Create the Scenes

The scripts are ready, but you need to create the scene files (.tscn) in the Godot editor:

#### MainMenu.tscn
- Root: Control (full rect)
  - MenuContent: VBoxContainer
    - Title: Label ("WORD RICE")
    - StartButton: Button ("START GAME")
    - Leaderboard: VBoxContainer
      - LeaderboardList: VBoxContainer

#### GameScene.tscn
- Root: Node2D
  - GameManager (attach GameManager.gd)
  - UI: CanvasLayer
    - TimerLabel: Label
    - ScoreLabel: Label
    - ProgressBar: ProgressBar
    - TaskDisplay: HBoxContainer
  - LetterPool: Node2D
  - RiceParticles: Node2D

#### LetterTile.tscn
- Root: Area2D (attach LetterTile.gd)
  - Background: ColorRect
  - LetterLabel: Label
  - CollisionShape2D: CollisionShape2D

#### RiceParticle.tscn
- Root: Node2D (attach RiceParticle.gd)
  - Sprite: ColorRect

#### InstructionsPopup.tscn
- Root: Control (full rect)
  - Panel: Panel
    - VBox: VBoxContainer
      - InstructionsText: RichTextLabel
      - CountdownLabel: Label

#### ScoreScreen.tscn
- Root: Control (full rect)
  - Panel: Panel
    - VBox: VBoxContainer
      - TaskList: VBoxContainer
      - TotalScore: Label
      - CountdownLabel: Label
  - NameInputPopup: Control
    - Panel: Panel
      - VBox: VBoxContainer
        - ScoreDisplay: Label
        - NameInput: LineEdit
        - SubmitButton: Button

### 4. Run the Game
- Press F5 or click the Play button
- Select MainMenu.tscn as the main scene

## 📦 Export Targets

Godot allows you to export to multiple platforms:

### Web (HTML5)
- Project → Export → Add → HTML5
- Configure export settings
- Export and upload to web server

### Windows
- Project → Export → Add → Windows Desktop
- Export as `.exe`

### Android
- Install Android SDK
- Project → Export → Add → Android
- Export as `.apk`

### iOS
- Requires macOS and Xcode
- Project → Export → Add → iOS
- Export as `.ipa`

## 🎯 Gameplay

1. **Main Menu** - View leaderboard and start game
2. **Instructions** - Learn how to play (5-second countdown)
3. **Game** - Complete as many 4-letter words as possible in 30 seconds
   - Click correct letters to fill the task word
   - Wrong clicks deduct 20 points
   - Faster completion = higher score (200 - time × 25)
4. **Score Screen** - View your performance
   - If top 10: Enter your name
   - Auto-return to menu after 8 seconds

## 🎨 Customization

### Change Bamboo Theme
Edit colors in scripts:
- `COLOR_NORMAL`, `COLOR_SELECTED` in LetterTile.gd
- Background colors in scene properties

### Add Sounds
- Add audio files to `Assets/Sounds/`
- Create AudioStreamPlayer nodes
- Uncomment sound functions in GameManager.gd

### Modify Scoring
Edit in `Global.gd`:
```gdscript
func complete_task(time_taken: float) -> int:
    var task_score = int(200.0 - (time_taken * 25.0))
    task_score = max(30, task_score)
    return task_score
```

### Change Timer
Edit in `GameManager.gd`:
```gdscript
const GAME_TIME = 30.0  # Change to desired seconds
```

## 🔧 Development Notes

### Global Autoload
The `Global.gd` singleton manages:
- Game state (score, timer, tasks)
- Leaderboard (save/load)
- Word dictionary

### Performance
- Letter tiles use Area2D for efficient collision
- Particles auto-delete after lifetime
- Minimal allocations in game loop

### Save System
- Leaderboard saved to `user://leaderboard.json`
- Automatically persists between sessions
- Location varies by platform:
  - Windows: `%APPDATA%\Godot\app_userdata\Word Rice\`
  - Linux: `~/.local/share/godot/app_userdata/Word Rice/`
  - macOS: `~/Library/Application Support/Godot/app_userdata/Word Rice/`

## 🐛 Troubleshooting

### Scenes not loading
- Ensure all scene files are created
- Check node names match script references
- Verify scripts are attached to correct nodes

### No sounds playing
- Implement audio in `play_*_sound()` functions in GameManager.gd
- Add AudioStreamPlayer nodes to scenes

### Leaderboard not saving
- Check file permissions in user data directory
- Verify `Global.gd` is in Autoload settings

## 📝 License

Same as parent Word Rice project.

## 🤝 Contributing

Feel free to:
- Add more word categories
- Create new themes
- Implement power-ups
- Add sound effects
- Improve particle effects

## 🔗 Related

- **HTML5 Version**: `../HTML5-Version/index.html`
- **GitHub Repo**: https://github.com/HanisRahim/WordRice

