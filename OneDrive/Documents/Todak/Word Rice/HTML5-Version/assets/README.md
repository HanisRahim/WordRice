# Word Rice - Assets Folder

This folder contains all game assets organized by type.

## Current Project Structure

```
Word Rice/
├── word-rice.html          (Main game file)
└── assets/
    ├── images/             (Graphics and sprites)
    ├── sounds/             (Audio and music)
    └── fonts/              (Custom fonts)
```

## Current Implementation

Word Rice currently uses **web-native technologies** for all assets:

### Graphics
- ✅ **CSS Gradients**: Bamboo background texture
- ✅ **CSS Animations**: Rice particles with physics
- ✅ **Emoji Characters**: Character avatar (🧑 Aman)
- ✅ **CSS Styling**: All UI elements (buttons, panels, tiles)

### Sounds
- ✅ **Web Audio API**: Procedurally generated sound effects
  - Correct letter: 600Hz sine wave
  - Wrong letter: 200Hz sine wave
  - Task complete: C-E-G melody

### Fonts
- ✅ **System Fonts**: Comic Sans MS, Arial Rounded MT Bold

## Benefits of Current Approach

- 🚀 **No external dependencies**: Single HTML file
- ⚡ **Instant loading**: No file downloads needed
- 📦 **Small file size**: ~130KB total
- 🌐 **Works offline**: Self-contained

## When to Add Asset Files

Consider adding external assets when you need:
- 🎨 Higher quality graphics (sprites, illustrations)
- 🎵 Professional sound effects or background music
- 🔤 Branded or stylized fonts
- 📱 Platform-specific resources

## How to Add New Assets

1. **Images**: Save to `assets/images/` and reference in HTML/CSS
2. **Sounds**: Save to `assets/sounds/` and load with Audio API
3. **Fonts**: Save to `assets/fonts/` and define with @font-face

See individual folder READMEs for detailed instructions.

## Future Enhancement Ideas

- Custom rice grain sprites (PNG/SVG)
- Character animation frames
- Background music loop
- UI button graphics
- Custom wood texture images
- Bamboo mat background image

