# Sound Assets Folder

This folder is for storing game sound effects and music.

## Current Sound Implementation

Currently, all sounds in Word Rice are generated using the **Web Audio API**:
- **Correct letter sound**: 600Hz tone
- **Invalid letter sound**: 200Hz tone  
- **Task completion sound**: Three-note melody (C-E-G)

## Future Sounds

You can add audio files here for:
- Better quality sound effects
- Background music
- UI click sounds
- Celebration sounds
- Ambient sounds

## Supported Audio Formats

- `.mp3` - Best browser support
- `.ogg` - Good quality, open format
- `.wav` - Uncompressed, larger files
- `.m4a` - Good for iOS devices

## Usage

To use an audio file in the game:
```javascript
const audio = new Audio('assets/sounds/filename.mp3');
audio.play();
```

