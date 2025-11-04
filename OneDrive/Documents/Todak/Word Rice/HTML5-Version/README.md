# Word Rice - HTML5 Version

The web-based version of Word Rice - a single HTML file containing the complete game!

## 🌐 Play Online

**Live Demo:** https://hanisrahim.github.io/WordRice/HTML5-Version/index.html

## 💻 Play Locally

### Option 1: Double-Click (Easiest)
Simply double-click `index.html` and it opens in your default browser!

### Option 2: Specific Browser
Right-click `index.html` → Open with → Choose your browser:
- Chrome
- Firefox
- Edge
- Safari
- Opera

### Option 3: Local Web Server
```bash
# Python 3
python -m http.server 8000

# Then visit: http://localhost:8000/index.html
```

## ✨ Features

- ✅ **Single File**: Everything in one HTML file (~130KB)
- ✅ **No Installation**: Works immediately
- ✅ **Offline Play**: No internet required after loading
- ✅ **Cross-Browser**: Works on all modern browsers
- ✅ **Mobile Friendly**: Plays on phones and tablets
- ✅ **LocalStorage**: Leaderboard persists between sessions

## 🎮 What's Included

### Gameplay
- 30-second fast-paced word matching
- 12 random letters per task
- 4-letter word challenges
- Physics-based rice particle effects
- Flying letter animations
- Shake animations for wrong letters

### UI/UX
- Main menu with leaderboard
- Instructions with countdown
- Score tracking with breakdown
- Top 10 name entry system
- Auto-return to menu

### Technical
- Pure JavaScript (no frameworks)
- CSS3 animations
- Web Audio API for sounds
- LocalStorage for saves
- RequestAnimationFrame for smooth particles

## 📊 File Size Breakdown

```
index.html:  ~130KB
  - HTML:      ~5KB
  - CSS:       ~15KB
  - JavaScript: ~110KB
    - Word Dictionary: ~25KB
    - Game Logic: ~85KB
```

## 🔧 Customization

All customization is done by editing `index.html`:

### Change Timer
Find and edit (line ~809):
```javascript
timeLeft: 30,  // Change to desired seconds
```

### Change Scoring Formula
Find and edit (line ~819-821):
```javascript
const calculatedScore = 200 - (timeElapsed * 25);
const displayScore = Math.max(30, Math.round(calculatedScore));
```

### Add/Remove Words
Find the `wordDictionary` array (line ~820+) and add/remove words:
```javascript
const wordDictionary = new Set([
    'WORD', 'RICE', 'GAME', // ... add more here
]);
```

### Change Colors
Find CSS section (line ~10-400) and edit colors:
```css
background: #C19A6B;  /* Bamboo background */
color: #FFD700;       /* Gold text */
```

## 🌐 Hosting

### GitHub Pages (Current)
Already hosted at: https://hanisrahim.github.io/WordRice/HTML5-Version/index.html

### Netlify
1. Drag `index.html` to netlify.com/drop
2. Get instant URL

### Vercel
1. Install Vercel CLI
2. Run `vercel` in HTML5-Version folder
3. Deploy instantly

### Your Own Server
Upload `index.html` to any web server - that's it!

## 🎯 Performance

- **Load Time**: < 1 second
- **FPS**: Consistent 60fps
- **Memory**: ~50MB
- **Battery**: Minimal impact

## 🔒 Privacy

- **No Analytics**: Zero tracking
- **No Cookies**: Only localStorage for leaderboard
- **No Network**: Fully offline after loading
- **No Data Collection**: Everything stays on your device

## 🆚 vs Godot Version

| Feature | HTML5 | Godot |
|---------|-------|-------|
| File Size | 130KB | ~5MB+ |
| Installation | None | Godot required |
| Web Deploy | ✅ Perfect | ✅ Possible |
| Desktop App | ❌ No | ✅ Yes (.exe) |
| Mobile App | ❌ Browser only | ✅ Yes (APK/IPA) |
| Performance | ⚡ Good | ⚡⚡ Better |
| Customization | Edit file | Full engine |
| Dependencies | None | Godot Engine |

## 📱 Mobile Considerations

The game works on mobile browsers, but:
- Touch events work as clicks
- Smaller screen = harder to click letters
- Consider using Godot version for native mobile apps

## 🐛 Browser Compatibility

### ✅ Fully Supported
- Chrome/Edge 90+
- Firefox 88+
- Safari 14+
- Opera 76+

### ⚠️ Partial Support
- Internet Explorer: Not supported
- Older mobile browsers: May have issues

### Required Features
- CSS Grid & Flexbox
- ES6 JavaScript (arrow functions, const/let)
- Web Audio API
- LocalStorage
- RequestAnimationFrame

## 💾 Save Data

Leaderboard is stored in browser's LocalStorage:
- **Key**: `wordRiceLeaderboard`
- **Format**: JSON array
- **Size**: < 1KB

### Clear Leaderboard
Open browser console (F12) and run:
```javascript
localStorage.removeItem('wordRiceLeaderboard');
location.reload();
```

## 🎨 Future Enhancements

Possible additions (would increase file size):
- [ ] Background music (encode as base64)
- [ ] Custom fonts (web fonts or embedded)
- [ ] Sprite images for rice particles
- [ ] Character animations
- [ ] More visual effects
- [ ] Additional game modes

## 📖 Code Quality

- ✅ **No external dependencies**
- ✅ **Clean, readable code**
- ✅ **Commented sections**
- ✅ **Modular functions**
- ✅ **No console errors**
- ✅ **Responsive design**

## 🔗 Links

- **Main Project**: [../README.md](../README.md)
- **Godot Version**: [../Godot-Version/README.md](../Godot-Version/README.md)
- **GitHub Repo**: https://github.com/HanisRahim/WordRice
- **Play Online**: https://hanisrahim.github.io/WordRice/HTML5-Version/index.html

---

**Happy Gaming! 🍚🎮**

