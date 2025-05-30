# OTClient Dark Theme Enhancement

## Overview
This enhancement transforms the OTClient interface into a modern, dark theme with improved visuals and a more contemporary look.

## Features

### Visual Improvements
- **Dark Theme**: Dark-themed UI with white text for better contrast and reduced eye strain
- **Lightweight Implementation**: Minimal impact on performance and memory usage
- **High-contrast Text**: White text on dark backgrounds for better readability
- **Runtime Theming**: Theme is applied at runtime without requiring image assets
- **UI Glow**: Subtle glow shader effect on UI elements (if shaders are supported)

## Installation

The theme is already installed and should work automatically when you open the client. No rebuilding is required.

## How It Works

This implementation uses a lightweight approach to modify UI elements at runtime:

1. Changing the color of UI elements to dark variants
2. Setting white text for better contrast
3. Applying styling only to main UI containers to minimize performance impact
4. Using existing resources without requiring additional assets

This approach ensures compatibility with the existing client while minimizing any potential impact on performance or stability.

## Customization

You can customize the theme by editing the following files:

- `modules/client_styles/dark_theme.lua` - Main theme implementation with color definitions
- `otclientrc.lua` - Theme application and additional styling

### Color Definitions

You can modify the color definitions in `modules/client_styles/dark_theme.lua` to change the theme colors:

```lua
local DARK_BG = '#222222'
local PANEL_BG = '#1A1A1A'
local BUTTON_BG = '#333333'
local TEXT_COLOR = '#FFFFFF'
```

## Troubleshooting

If you experience any issues with the theme:

1. Check the client log for error messages
2. Try commenting out the theme application code in `otclientrc.lua`
3. Restart the client

## Files Modified

- `otclientrc.lua` - Added theme application code
- `modules/client_styles/styles.lua` - Updated to load dark theme and skip custom fonts
- `data/styles/*.otui` - Modified to use default fonts and existing resources

## Files Added

- `modules/client_styles/dark_theme.lua` - Lightweight theme implementation

## Font Handling

To avoid font-related errors, this implementation:

1. Removes all font references from UI style files
2. Skips loading custom fonts in the styles.lua file
3. Uses the client's default font for all UI elements

This approach ensures maximum compatibility across different client versions and configurations.