# Graphics Assets Folder

This folder is for storing game graphics and image assets.

## Current Graphics Implementation

Currently, all visual elements in Word Rice are created using:
- **CSS Gradients**: Bamboo texture background
- **CSS Animations**: Rice particles, letter tiles
- **Emoji**: Character avatar (🧑)
- **CSS Styling**: All UI components

## Future Graphics

You can add image files here for:
- Custom character sprites
- Letter tile backgrounds
- Rice particle images
- Background textures
- UI element graphics
- Logo/title image

## Recommended File Structure

```
assets/
├── images/
│   ├── characters/
│   ├── ui/
│   ├── particles/
│   └── backgrounds/
├── sounds/
└── fonts/
```

## Usage

To use an image in the game, reference it from the HTML like:
```html
<img src="assets/images/filename.png" alt="description">
```

Or in CSS:
```css
background-image: url('../assets/images/filename.png');
```

