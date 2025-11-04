# Word Rice 🍚

A fast-paced 4-letter word puzzle game where speed and accuracy are rewarded!

![Word Rice Game](https://img.shields.io/badge/Game-Word%20Rice-gold?style=for-the-badge)
![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=flat&logo=html5&logoColor=white)
![Godot](https://img.shields.io/badge/Godot-478CBF?style=flat&logo=godot-engine&logoColor=white)

## 🎮 Game Overview

**Word Rice** is a word puzzle game where players race against a 30-second timer to complete as many 4-letter words as possible. Select the correct letters from a pool to spell the target word, but beware - wrong letters cost you points!

### Features

- ⏱️ **30-Second Timer** - Fast-paced gameplay
- 🎯 **Speed-Based Scoring** - Faster completion = higher points (200 - time × 25)
- 💔 **Wrong Letter Penalty** - -20 points for incorrect clicks
- 🏆 **Top 10 Leaderboard** - Save your name and compete
- 🍚 **Rice Particle Effects** - Physics-based visual feedback
- 🎨 **Bamboo Wood Theme** - Beautiful rustic aesthetic
- 📱 **Cross-Platform** - Play on web or desktop

## 📁 Project Versions

This repository contains TWO complete versions of the game:

### 1. HTML5 Version (Web)
**Location:** `/HTML5-Version/`

- ✅ Single self-contained HTML file
- ✅ ~130KB total size
- ✅ Works in any modern browser
- ✅ No installation needed
- ✅ Fully offline-capable
- ✅ Perfect for web deployment

**Play Now:**
- Local: Double-click `HTML5-Version/index.html`
- Online: https://hanisrahim.github.io/WordRice/HTML5-Version/index.html

[View HTML5 Documentation →](HTML5-Version/assets/README.md)

### 2. Godot Version (Game Engine)
**Location:** `/Godot-Version/`

- ✅ Built with Godot 4.2+
- ✅ Full game engine features
- ✅ Export to Windows, Mac, Linux, Android, iOS
- ✅ Better performance
- ✅ Easier to expand and modify
- ✅ Professional game architecture

**Requirements:**
- Godot Engine 4.2 or later
- Scenes must be created in editor (scripts provided)

[View Godot Documentation →](Godot-Version/README.md)

## 🚀 Quick Start

### Play HTML5 Version (Easiest)
```bash
# Clone the repository
git clone https://github.com/HanisRahim/WordRice.git
cd WordRice

# Open in browser
# Windows
start HTML5-Version/index.html

# macOS
open HTML5-Version/index.html

# Linux
xdg-open HTML5-Version/index.html
```

### Open Godot Version
1. Install [Godot Engine](https://godotengine.org) 4.2+
2. Open Godot
3. Click "Import"
4. Select `Godot-Version/project.godot`
5. Follow the [scene setup guide](Godot-Version/README.md)
6. Press F5 to run

## 🎯 How to Play

1. **Start Game** - Click "START GAME" from main menu
2. **Read Instructions** - Learn the rules (5-second countdown)
3. **Play** - You have 30 seconds to complete as many words as possible:
   - A **greyed-out 4-letter word** appears at the bottom (the task)
   - Click the **correct letters** from the pool to spell it
   - Letters can be clicked in **any order**
   - **Wrong letters** shake and deduct 20 points
   - **Correct letters** fly to their slot with rice particles 🍚
4. **Score** - Faster completion earns more points!
   - Formula: `200 - (time × 25)` points per word
   - Minimum 30 points per word
5. **Leaderboard** - Top 10 scores get to enter their name

### Scoring Example
```
Task: WORD
Time: 2.34 seconds
Score: 200 - (2.34 × 25) = 142 points

Wrong clicks: 3
Penalty: -60 points

Final Score: 142 - 60 = 82 points
```

## 📊 Project Structure

```
WordRice/
├── README.md                    # This file
├── HTML5-Version/              # Web version
│   ├── index.html              # Complete game (single file)
│   └── assets/                 # Asset folder structure
│       ├── images/
│       ├── sounds/
│       └── fonts/
└── Godot-Version/              # Game engine version
    ├── project.godot           # Godot project file
    ├── README.md               # Godot documentation
    ├── Scenes/                 # Game scenes
    ├── Scripts/                # GDScript files
    ├── Assets/                 # Game assets
    └── Autoload/               # Global scripts
        └── Global.gd           # Game state manager
```

## 🛠️ Technology Stack

### HTML5 Version
- **Pure HTML5** - No framework dependencies
- **CSS3** - Animations and styling
- **JavaScript (ES6+)** - Game logic
- **Web Audio API** - Sound generation
- **LocalStorage** - Leaderboard persistence

### Godot Version
- **Godot Engine 4.2+** - Game framework
- **GDScript** - Game scripting
- **Scene System** - Component architecture
- **Tween Animations** - Smooth transitions
- **JSON** - Save file format

## 🎨 Customization

### Change Game Timer
**HTML5:** Edit line ~809 in `index.html`
```javascript
gameState.timeLeft = 30; // Change to desired seconds
```

**Godot:** Edit `Godot-Version/Scripts/GameManager.gd`
```gdscript
const GAME_TIME = 30.0  # Change to desired seconds
```

### Modify Scoring
**HTML5:** Edit line ~819-821 in `index.html`
```javascript
const calculatedScore = 200 - (timeElapsed * 25);
```

**Godot:** Edit `Godot-Version/Autoload/Global.gd`
```gdscript
var task_score = int(200.0 - (time_taken * 25.0))
```

### Add More Words
Both versions use the same word dictionary. Edit the word list in:
- **HTML5:** Line ~820 in `index.html`
- **Godot:** `Godot-Version/Autoload/Global.gd`

## 📦 Deployment

### HTML5 - GitHub Pages
Already deployed! Play at:
https://hanisrahim.github.io/WordRice/HTML5-Version/index.html

### HTML5 - Other Hosts
Upload `HTML5-Version/index.html` to any web server:
- Netlify (drag & drop)
- Vercel (connect repo)
- GitHub Pages
- Your own server

### Godot - Export
Export from Godot Editor:
1. Project → Export
2. Add export template (Windows/Mac/Linux/Android/iOS)
3. Configure settings
4. Export project

## 🐛 Known Issues

### HTML5 Version
- None currently

### Godot Version
- Scenes need to be created manually in editor
- Sound functions need implementation
- Rice particle visual needs sprite/shader improvement

## 🤝 Contributing

Contributions are welcome! Areas for improvement:

- [ ] Add background music
- [ ] Create more word categories (animals, food, etc.)
- [ ] Add difficulty levels (shorter/longer time)
- [ ] Implement power-ups
- [ ] Add animations for character
- [ ] Create custom rice grain sprites
- [ ] Add achievement system
- [ ] Multiplayer mode

## 📝 License

This project is open source and available for personal and educational use.

## 👤 Author

**Hanis Rahim**
- GitHub: [@HanisRahim](https://github.com/HanisRahim)

## 🙏 Acknowledgments

- Inspired by classic word puzzle games
- Built with ❤️ and 🍚

## 📧 Contact

For questions or suggestions, please open an issue on GitHub.

---

**Enjoy the game! 🍚🎮**

