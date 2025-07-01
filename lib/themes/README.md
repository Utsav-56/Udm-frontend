# UDM Downloader Theme System

This document explains the comprehensive theme system for the UDM Downloader application. The theme system is organized into modular components for easy maintenance and customization.

## Theme Structure

The theme system is divided into several specialized files:

### 1. `app_colors.dart`

Central color palette with all application colors:

-   Primary and secondary colors
-   Background and surface colors
-   Text colors for different contexts
-   Semantic colors (success, warning, error)
-   Utility methods for color manipulation

### 2. `text_themes.dart`

Typography system with:

-   Font families and weights
-   Text styles for different UI elements
-   Both light and dark theme variants
-   Custom styles for specific use cases (numbers, buttons, lists)

### 3. `icon_themes.dart`

Icon styling configurations:

-   Icon sizes for different contexts
-   Icon colors for various states
-   Themed icon configurations
-   Custom icon theme generators

### 4. `card_themes.dart`

Card component styling:

-   Card colors and elevations
-   Border radius and shapes
-   Padding and margin configurations
-   Custom card decoration utilities

### 5. `input_decoration_themes.dart`

Input field styling:

-   Default input decorations
-   Specialized inputs (search, URL)
-   Border and focus states
-   Custom input generators

### 6. `component_themes.dart`

Button and switch component themes:

-   Switch themes for toggles
-   Button themes (elevated, outlined, text, icon)
-   Custom component styling utilities

### 7. `app_theme.dart`

Main theme composition that combines all components into complete `ThemeData` objects.

## Usage Examples

### Basic Application Setup

```dart
import 'package:flutter/material.dart';
import 'themes/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UDM Downloader',
      theme: AppTheme.lightTheme,      // Optional light theme
      darkTheme: AppTheme.darkTheme,   // Primary dark theme
      themeMode: AppTheme.themeMode,   // Defaults to dark
      home: MyHomePage(),
    );
  }
}
```

### Using Colors

```dart
import 'themes/app_colors.dart';

// Direct color usage
Container(
  color: AppColors.primaryColor,
  child: Text(
    'Primary colored container',
    style: TextStyle(color: AppColors.textColor),
  ),
)

// Color utilities
Container(
  color: AppColors.withOpacity(AppColors.primaryColor, 0.5),
  child: Text('Semi-transparent'),
)
```

### Using Text Styles

```dart
import 'themes/text_themes.dart';

// Predefined text styles
Text('Large Number', style: TextThemes.numberLarge),
Text('Card Title', style: TextThemes.cardTitle),
Text('List Item', style: TextThemes.listItemTitle),
Text('Subtitle', style: TextThemes.listItemSubtitle),

// Custom text style
Text(
  'Custom Text',
  style: TextThemes.getCustomTextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  ),
),
```

### Using Icon Themes

```dart
import 'themes/icon_themes.dart';

// Themed icons
Icon(
  Icons.download,
  color: IconThemes.primaryIconColor,
  size: IconThemes.defaultIconSize,
)

// Custom icon theme
IconTheme(
  data: IconThemes.getCustomIconTheme(Colors.red, 32.0),
  child: Icon(Icons.error),
)
```

### Using Card Themes

```dart
import 'themes/card_themes.dart';

// Default themed card
Card(
  child: Padding(
    padding: CardThemes.getCardPadding('medium'),
    child: Text('Card content'),
  ),
)

// Custom card with Container
Container(
  decoration: CardThemes.getCardDecoration(
    color: AppColors.primaryColor,
    borderRadius: 16.0,
  ),
  child: Text('Custom card'),
)
```

### Using Input Decorations

```dart
import 'themes/input_decoration_themes.dart';

// URL input field
TextField(
  decoration: InputDecorationThemes.urlInputDecoration,
)

// Search field
TextField(
  decoration: InputDecorationThemes.searchInputDecoration,
)

// Custom input
TextField(
  decoration: InputDecorationThemes.getCustomInputDecoration(
    hintText: 'Enter filename',
    prefixIcon: Icons.file_present,
  ),
)
```

### Using Button Themes

```dart
import 'themes/component_themes.dart';

// Themed buttons (automatically styled by theme)
ElevatedButton(
  onPressed: () {},
  child: Text('Download'),
)

// Custom button style
ElevatedButton(
  style: ButtonThemes.getCustomElevatedButtonStyle(
    backgroundColor: AppColors.successColor,
    borderRadius: 12.0,
  ),
  onPressed: () {},
  child: Text('Success Button'),
)

// Size variants
ElevatedButton(
  style: ButtonThemes.smallButtonStyle,
  onPressed: () {},
  child: Text('Small'),
)

ElevatedButton(
  style: ButtonThemes.largeButtonStyle,
  onPressed: () {},
  child: Text('Large'),
)
```

### Theme Context Utilities

```dart
import 'themes/app_theme.dart';

Widget build(BuildContext context) {
  // Check current theme
  bool isDark = AppTheme.isDarkMode(context);

  // Get theme colors
  Color primary = AppTheme.getPrimaryColor(context);
  Color background = AppTheme.getBackgroundColor(context);
  Color text = AppTheme.getTextColor(context);

  return Container(
    color: background,
    child: Text(
      'Themed text',
      style: TextStyle(color: text),
    ),
  );
}
```

## Dependencies

To use this theme system, add these dependencies to your `pubspec.yaml`:

```yaml
dependencies:
    flutter:
        sdk: flutter
    google_fonts: ^6.1.0

dev_dependencies:
    flutter_test:
        sdk: flutter
```

Then run:

```bash
flutter pub get
```

## Customization

### Adding New Colors

Add colors to `app_colors.dart`:

```dart
class AppColors {
  // ...existing colors...

  /// New custom color
  static const Color customColor = Color(0xFF123456);
}
```

### Adding New Text Styles

Add styles to `text_themes.dart`:

```dart
class TextThemes {
  // ...existing styles...

  /// Custom text style for special elements
  static const TextStyle specialText = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: AppColors.customColor,
  );
}
```

### Modifying Existing Themes

Edit the specific theme file (e.g., `card_themes.dart`) and the changes will automatically be reflected in the main theme.

## Best Practices

1. **Use theme colors instead of hardcoded colors**
2. **Prefer predefined text styles over custom ones**
3. **Use the appropriate icon theme for context**
4. **Leverage card theme utilities for consistent spacing**
5. **Test both light and dark themes if supporting both**
6. **Use theme context utilities for dynamic theming**

This modular approach ensures:

-   **Consistency** across the application
-   **Easy maintenance** and updates
-   **Flexibility** for customization
-   **Type safety** with proper documentation
-   **Performance** through const constructors where possible
