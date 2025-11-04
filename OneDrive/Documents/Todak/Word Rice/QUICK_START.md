# 🚀 Word Rice - Quick Start Guide

Choose your platform and start playing in minutes!

## 📱 Just Want to Play?

### Web Browser (Instant!)
**No installation needed:**
1. Open: `HTML5-Version/index.html` (double-click)
2. Play immediately! 🎮

**Or play online:**
https://hanisrahim.github.io/WordRice/HTML5-Version/index.html

---

## 🎮 Want the Full Game Engine Version?

### Godot Setup (10 minutes)

#### Step 1: Install Godot
- Download: https://godotengine.org/download
- Get **Godot 4.2+** (Standard, not .NET)
- Extract and run

#### Step 2: Import Project
1. Open Godot
2. Click **"Import"**
3. Browse to `Godot-Version/project.godot`
4. Click **"Import & Edit"**

#### Step 3: Run
- Press **F5** (or click Play ▶️)
- Select `MainMenu.tscn` if asked
- Game starts! 🎉

**Full setup guide:** [Godot-Version/SETUP.md](Godot-Version/SETUP.md)

---

## 📁 Project Structure

```
Word Rice/
│
├── 🌐 HTML5-Version/          ← Web version (ready to play!)
│   ├── index.html             ← Double-click to play
│   └── assets/                ← Asset structure docs
│
├── 🎮 Godot-Version/          ← Game engine version
│   ├── project.godot          ← Import this in Godot
│   ├── Scenes/                ← Pre-configured scenes
│   ├── Scripts/               ← Complete GDScript files
│   ├── Autoload/              ← Global game manager
│   ├── SETUP.md               ← Detailed setup guide
│   └── README.md              ← Godot documentation
│
└── 📖 README.md               ← Main documentation
```

---

## 🎯 Which Version Should I Use?

### Use HTML5 if you want to:
- ✅ Play immediately (no setup)
- ✅ Share on web (just a URL)
- ✅ Keep it simple (one file)
- ✅ Works everywhere (any browser)

### Use Godot if you want to:
- ✅ Make a desktop app (.exe)
- ✅ Create mobile apps (Android/iOS)
- ✅ Better performance
- ✅ Expand features easily
- ✅ Professional game development

### Use Both!
They're identical in gameplay - choose based on deployment needs! 🚀

---

## 🎮 Game Controls

### How to Play
1. **Main Menu** → Click "START GAME"
2. **Instructions** → Read rules (5-second countdown)
3. **Game** → Click correct letters to spell the word
   - Greyed word at bottom = your task
   - Click the right letters from the pool
   - Wrong letters shake and cost 20 points
   - Complete as many as possible in 30 seconds!
4. **Score Screen** → View results
   - Top 10? Enter your name!
   - Auto-returns to menu in 8 seconds

### Scoring
- **Faster = Better**: 200 - (time × 25) points per word
- **Wrong Click**: -20 points each
- **Minimum**: 30 points per word

---

## 📦 Export Your Game

### HTML5 → Web
Already done! Just upload `HTML5-Version/index.html` to any web host.

### Godot → Windows .exe
1. Open in Godot
2. Project → Export → Add → Windows Desktop
3. Export to `builds/windows/WordRice.exe`
4. Share the folder!

### Godot → Android .apk
1. Install Android SDK
2. Project → Export → Add → Android
3. Export to `builds/android/WordRice.apk`
4. Install on phone!

---

## 🔗 Useful Links

- **GitHub Repo**: https://github.com/HanisRahim/WordRice
- **Play Online**: https://hanisrahim.github.io/WordRice/HTML5-Version/index.html
- **Godot Engine**: https://godotengine.org
- **Godot Docs**: https://docs.godotengine.org

---

## 💡 Tips

### HTML5
- Works offline after first load
- Leaderboard saved in browser
- Clear data: Browser → Clear site data

### Godot
- All scripts are complete and ready
- Scenes are pre-configured
- Just open and run!
- See SETUP.md for customization

---

## 🆘 Need Help?

### HTML5 Not Working?
- Try a different browser
- Check browser console (F12) for errors
- Ensure JavaScript is enabled

### Godot Not Working?
- Check Godot version (needs 4.2+)
- Verify all scripts attached to scenes
- See troubleshooting in Godot-Version/SETUP.md

### Questions?
Open an issue on GitHub: https://github.com/HanisRahim/WordRice/issues

---

**Ready to Play! 🍚🎮**

Choose your version and have fun!

