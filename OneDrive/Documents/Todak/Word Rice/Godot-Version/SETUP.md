# Word Rice - Godot Setup Guide

This guide will help you set up and run the Godot version of Word Rice.

## ✅ Prerequisites

1. **Download Godot Engine 4.2+**
   - Visit: https://godotengine.org/download
   - Download the Standard version (not .NET version)
   - Extract and run `Godot_v4.x.exe`

## 📥 Step 1: Import Project

1. **Launch Godot Engine**
2. Click **"Import"** button
3. Click **"Browse"**
4. Navigate to the `Godot-Version` folder
5. Select `project.godot` file
6. Click **"Import & Edit"**

The project will open in the Godot editor!

## 🎨 Step 2: Verify Scenes

The project includes these pre-configured scenes:

✅ **MainMenu.tscn** - Ready to use
✅ **GameScene.tscn** - Ready to use  
✅ **InstructionsPopup.tscn** - Ready to use
✅ **ScoreScreen.tscn** - Ready to use
✅ **LetterTile.tscn** - Ready to use
✅ **RiceParticle.tscn** - Ready to use

All scenes are configured and scripts are attached!

## ▶️ Step 3: Run the Game

1. **Set Main Scene:**
   - Project → Project Settings → Application → Run
   - Set Main Scene to `res://Scenes/MainMenu.tscn`
   - Or: Press F5 and select MainMenu.tscn when prompted

2. **Run:**
   - Press **F5** or click the **Play** button (▶️)
   - The game should start!

## 🎮 Step 4: Test Gameplay

1. Click **START GAME** on main menu
2. Read instructions (5-second countdown)
3. Click correct letters to spell the word
4. Complete as many words as possible in 30 seconds!

## 🔧 Optional: Customize Scenes

You can enhance the scenes in the Godot editor:

### Add Bamboo Background Texture
1. Create or import bamboo texture image
2. In GameScene.tscn:
   - Select Background ColorRect
   - Add TextureRect as child
   - Set texture and scale

### Add Sound Effects
1. Import audio files to `Assets/Sounds/`
2. Add AudioStreamPlayer nodes to scenes
3. Uncomment sound functions in `GameManager.gd`:

```gdscript
func play_correct_sound():
    $CorrectSound.play()

func play_wrong_sound():
    $WrongSound.play()

func play_yay_sound():
    $YaySound.play()
```

### Style the UI
1. Open scenes in editor
2. Select UI nodes (Labels, Buttons, etc.)
3. In Inspector panel:
   - Theme Overrides → Colors
   - Theme Overrides → Font Sizes
   - Theme Overrides → Styles

### Improve Rice Particles
1. Create custom rice grain sprite
2. Replace ColorRect in RiceParticle.tscn with Sprite2D
3. Add shader for better visuals

## 📦 Step 5: Export Game

### Export to Web (HTML5)
1. **Editor → Manage Export Templates**
2. **Download templates** for your Godot version
3. **Project → Export**
4. **Add → HTML5/WebAssembly**
5. Configure settings:
   - Export Path: `builds/web/index.html`
6. Click **Export Project**
7. Upload the `builds/web/` folder to web server

### Export to Windows
1. **Project → Export**
2. **Add → Windows Desktop**
3. Configure settings:
   - Export Path: `builds/windows/WordRice.exe`
4. Click **Export Project**
5. Distribute the entire `builds/windows/` folder

### Export to Android
1. **Install Android SDK** (follow Godot docs)
2. **Project → Export**
3. **Add → Android**
4. Configure settings and keystore
5. Click **Export Project** as `.apk`

## 🐛 Troubleshooting

### "Invalid Scene" Error
- Make sure all scenes are saved
- Verify scene paths in scripts match actual file paths
- Check that scripts are attached to correct nodes

### No Visual Elements Showing
- Check node visibility (eye icon in scene tree)
- Verify CanvasLayer is used for UI elements
- Check z-index/layer settings

### Letters Not Clickable
- Verify CollisionShape2D is present in LetterTile
- Check Area2D input_pickable is enabled
- Ensure mouse filter is set correctly

### Timer Not Working
- Verify Global.gd is in Autoload (Project Settings → Autoload)
- Check `is_game_active` flag is set to true
- Ensure `_process(delta)` is being called

### Leaderboard Not Saving
- Check console for file access errors
- Verify write permissions in user data directory
- Test with `print(Global.leaderboard)` to debug

## 💡 Tips

### Performance Optimization
- Use object pooling for rice particles (reuse instead of create/destroy)
- Limit max particles on screen
- Use VisibleOnScreenNotifier2D to disable off-screen elements

### Better Visuals
- Import custom fonts to `Assets/Fonts/`
- Create sprite atlases for UI elements
- Add shader effects for glow/shadows
- Use AnimationPlayer for complex animations

### Better Audio
- Record or download sound effects
- Import to `Assets/Sounds/`
- Use AudioStreamPlayer with volume/pitch variation
- Add background music loop

## 📚 Learning Resources

- **Godot Documentation**: https://docs.godotengine.org
- **GDScript Tutorial**: https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/
- **2D Game Tutorial**: https://docs.godotengine.org/en/stable/getting_started/first_2d_game/

## ✅ Next Steps

1. ✅ Project imported successfully
2. ✅ All scenes configured
3. ✅ Scripts attached and working
4. ⏳ **Customize visual assets** (optional)
5. ⏳ **Add sound effects** (optional)
6. ⏳ **Export to desired platform**
7. ⏳ **Share your game!**

## 🎯 Quick Test Checklist

- [ ] Main menu displays with leaderboard
- [ ] Start button works
- [ ] Instructions show with countdown
- [ ] Game starts after countdown
- [ ] Letters spawn without overlapping
- [ ] Correct letters fly to slots
- [ ] Wrong letters shake
- [ ] Score increases for correct words
- [ ] Score decreases for wrong clicks
- [ ] Timer counts down
- [ ] Game ends at 0:00
- [ ] Top 10 shows name input
- [ ] Score screen displays correctly
- [ ] Auto-returns to main menu

Enjoy building with Godot! 🎮🍚

