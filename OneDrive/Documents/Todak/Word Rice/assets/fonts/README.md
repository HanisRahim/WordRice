# Fonts Assets Folder

This folder is for storing custom font files.

## Current Font Implementation

Currently, Word Rice uses system fonts:
- **Primary**: Comic Sans MS
- **Fallback**: Arial Rounded MT Bold
- **Generic**: sans-serif

## Future Fonts

You can add custom font files here for:
- Custom game title font
- Score display font
- UI text font
- Handwritten style fonts

## Supported Font Formats

- `.woff2` - Best compression, modern browsers
- `.woff` - Good browser support
- `.ttf` - TrueType fonts
- `.otf` - OpenType fonts

## Usage

To use a custom font in the game, add to CSS:
```css
@font-face {
    font-family: 'CustomFont';
    src: url('../assets/fonts/customfont.woff2') format('woff2'),
         url('../assets/fonts/customfont.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

body {
    font-family: 'CustomFont', 'Comic Sans MS', sans-serif;
}
```

