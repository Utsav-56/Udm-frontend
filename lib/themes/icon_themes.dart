import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Icon theme configurations for the UDM Downloader application.
/// Provides centralized icon styling for consistent icon appearance across the app.
///
/// This class contains icon themes for different contexts including primary icons,
/// toolbar icons, navigation icons, and various interactive states.
///
/// Example:
///   ```dart
///   Icon(
///     Icons.download,
///     color: IconThemes.primaryIconColor,
///     size: IconThemes.defaultIconSize,
///   )
///   ```
class IconThemes {
  /// Default icon size used throughout the application
  static const double defaultIconSize = 20.0;

  /// Icon size for toolbar buttons and controls
  static const double toolbarIconSize = 24.0;

  /// Icon size for toolbar button icons (smaller than main toolbar icons)
  static const double toolbarButtonIconSize = 20.0;

  /// Icon size for side navigation items
  static const double sideNavIconSize = 28.0;

  /// Icon size for small actions and indicators
  static const double smallIconSize = 16.0;

  /// Icon size for large display icons
  static const double largeIconSize = 32.0;

  /// Primary icon color for important interactive elements
  static const Color primaryIconColor = AppColors.primaryColor;

  /// Secondary icon color for less prominent elements
  static const Color secondaryIconColor = AppColors.subtextColor;

  /// Icon color for text-related elements
  static const Color textIconColor = AppColors.textColor;

  /// Icon color for disabled states
  static const Color disabledIconColor = Color(0xFF4A5568);

  /// Icon color for success states
  static const Color successIconColor = Color(0xFF48BB78);

  /// Icon color for warning states
  static const Color warningIconColor = Color(0xFFED8936);

  /// Icon color for error states
  static const Color errorIconColor = Color(0xFFE53E3E);

  /// Default icon theme for the application
  /// Used as the base icon theme in ThemeData
  ///
  /// Example:
  ///   ```dart
  ///   ThemeData(
  ///     iconTheme: IconThemes.defaultIconTheme,
  ///   )
  ///   ```
  static const IconThemeData defaultIconTheme = IconThemeData(
    color: AppColors.subtextColor,
    size: defaultIconSize,
  );

  /// Icon theme for primary actions and highlighted elements
  ///
  /// Example:
  ///   ```dart
  ///   IconTheme(
  ///     data: IconThemes.primaryIconTheme,
  ///     child: Icon(Icons.download),
  ///   )
  ///   ```
  static const IconThemeData primaryIconTheme = IconThemeData(
    color: primaryIconColor,
    size: defaultIconSize,
  );

  /// Icon theme for toolbar elements
  ///
  /// Example:
  ///   ```dart
  ///   AppBar(
  ///     iconTheme: IconThemes.toolbarIconTheme,
  ///   )
  ///   ```
  static const IconThemeData toolbarIconTheme = IconThemeData(
    color: AppColors.textColor,
    size: toolbarIconSize,
  );

  /// Icon theme for navigation elements
  ///
  /// Example:
  ///   ```dart
  ///   NavigationRail(
  ///     selectedIconTheme: IconThemes.navigationIconTheme,
  ///   )
  ///   ```
  static const IconThemeData navigationIconTheme = IconThemeData(
    color: primaryIconColor,
    size: sideNavIconSize,
  );

  /// Icon theme for small decorative icons
  ///
  /// Example:
  ///   ```dart
  ///   Icon(
  ///     Icons.info_outline,
  ///     color: IconThemes.smallIconTheme.color,
  ///     size: IconThemes.smallIconTheme.size,
  ///   )
  ///   ```
  static const IconThemeData smallIconTheme = IconThemeData(
    color: secondaryIconColor,
    size: smallIconSize,
  );

  /// Icon theme for large display icons
  ///
  /// Example:
  ///   ```dart
  ///   Icon(
  ///     Icons.cloud_download,
  ///     color: IconThemes.largeIconTheme.color,
  ///     size: IconThemes.largeIconTheme.size,
  ///   )
  ///   ```
  static const IconThemeData largeIconTheme = IconThemeData(
    color: primaryIconColor,
    size: largeIconSize,
  );

  /// Gets an icon theme with a specific color while maintaining default size
  ///
  /// Parameters:
  ///   - color: The color to apply to the icons
  ///
  /// Returns:
  ///   - IconThemeData: Icon theme with the specified color
  ///
  /// Example:
  ///   ```dart
  ///   final redIconTheme = IconThemes.getColoredIconTheme(Colors.red);
  ///   ```
  static IconThemeData getColoredIconTheme(Color color) {
    return IconThemeData(
      color: color,
      size: defaultIconSize,
    );
  }

  /// Gets an icon theme with a specific size while maintaining default color
  ///
  /// Parameters:
  ///   - size: The size to apply to the icons
  ///
  /// Returns:
  ///   - IconThemeData: Icon theme with the specified size
  ///
  /// Example:
  ///   ```dart
  ///   final bigIconTheme = IconThemes.getSizedIconTheme(48.0);
  ///   ```
  static IconThemeData getSizedIconTheme(double size) {
    return IconThemeData(
      color: secondaryIconColor,
      size: size,
    );
  }

  /// Gets a custom icon theme with both color and size
  ///
  /// Parameters:
  ///   - color: The color to apply to the icons
  ///   - size: The size to apply to the icons
  ///
  /// Returns:
  ///   - IconThemeData: Custom icon theme with specified color and size
  ///
  /// Example:
  ///   ```dart
  ///   final customTheme = IconThemes.getCustomIconTheme(Colors.blue, 36.0);
  ///   ```
  static IconThemeData getCustomIconTheme(Color color, double size) {
    return IconThemeData(
      color: color,
      size: size,
    );
  }
}
