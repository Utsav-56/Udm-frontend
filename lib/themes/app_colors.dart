import 'package:flutter/material.dart';

/// Color palette for the UDM Downloader application.
/// Provides centralized color definitions for consistent theming across the app.
///
/// This class contains all color constants used throughout the application,
/// including primary colors, background colors, text colors, and semantic colors.
///
/// Example:
///   ```dart
///   Container(
///     color: AppColors.cardColor,
///     child: Text(
///       'Hello World',
///       style: TextStyle(color: AppColors.textColor),
///     ),
///   )
///   ```
class AppColors {
  /// Primary brand color used for main actions and highlights
  static const Color primaryColor = Color(0xFF00A3FF);

  /// Secondary color used for supporting elements
  static const Color secondaryColor = Color(0xFF172A46);

  /// Main background color for the application
  static const Color scaffoldBackgroundColor = Color(0xFF0A192F);

  /// Background color for cards and elevated surfaces
  static const Color cardColor = Color(0xFF172A46);

  /// Primary text color for high contrast readability
  static const Color textColor = Color(0xFFE6F1FF);

  /// Secondary text color for less prominent text
  static const Color subtextColor = Color(0xFF8892B0);

  /// Tertiary text color for accent text elements
  static const Color secondaryTextColor = Color.fromARGB(255, 208, 188, 255);

  // Button Colors
  /// Primary button background color
  static const Color buttonPrimaryColor = Color(0xFF00A3FF);

  /// Secondary button background color
  static const Color buttonSecondaryColor = Color(0x000a192f);

  // Semantic Colors
  /// Color for success states and positive actions
  static const Color successColor = Color(0xFF48BB78);

  /// Color for warning states and caution indicators
  static const Color warningColor = Color(0xFFED8936);

  /// Color for error states and destructive actions
  static const Color errorColor = Color(0xFFE53E3E);

  /// Color for informational states and neutral indicators
  static const Color infoColor = Color(0xFF4299E1);

  // Surface Colors
  /// Background color for elevated surfaces
  static const Color surfaceColor = Color(0xFF1A202C);

  /// Background color for input fields and forms
  static const Color inputBackgroundColor = cardColor;

  /// Border color for input fields and dividers
  static const Color borderColor = Color(0xFF2D3748);

  /// Color for disabled elements
  static const Color disabledColor = Color(0xFF4A5568);

  // Overlay Colors
  /// Semi-transparent overlay for modals and dialogs
  static const Color overlayColor = Color(0x80000000);

  /// Light overlay for hover states
  static const Color hoverOverlayColor = Color(0x10FFFFFF);

  /// Focus overlay for keyboard navigation
  static const Color focusOverlayColor = Color(0x20FFFFFF);

  /// Gets a color with applied opacity
  ///
  /// Parameters:
  ///   - color: The base color
  ///   - opacity: The opacity value (0.0 to 1.0)
  ///
  /// Returns:
  ///   - Color: The color with applied opacity
  ///
  /// Example:
  ///   ```dart
  ///   final transparentPrimary = AppColors.withOpacity(AppColors.primaryColor, 0.5);
  ///   ```
  static Color withOpacity(Color color, double opacity) {
    return color.withOpacity(opacity);
  }

  /// Gets a lighter shade of the given color
  ///
  /// Parameters:
  ///   - color: The base color
  ///   - amount: The amount to lighten (0.0 to 1.0)
  ///
  /// Returns:
  ///   - Color: The lightened color
  ///
  /// Example:
  ///   ```dart
  ///   final lightPrimary = AppColors.lighten(AppColors.primaryColor, 0.2);
  ///   ```
  static Color lighten(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    final lightness = (hsl.lightness + amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }

  /// Gets a darker shade of the given color
  ///
  /// Parameters:
  ///   - color: The base color
  ///   - amount: The amount to darken (0.0 to 1.0)
  ///
  /// Returns:
  ///   - Color: The darkened color
  ///
  /// Example:
  ///   ```dart
  ///   final darkPrimary = AppColors.darken(AppColors.primaryColor, 0.2);
  ///   ```
  static Color darken(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    final lightness = (hsl.lightness - amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }
}
