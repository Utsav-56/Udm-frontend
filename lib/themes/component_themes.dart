import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Switch and toggle theme configurations for the UDM Downloader application.
/// Provides centralized switch styling for consistent toggle appearance across the app.
///
/// This class contains switch themes for different contexts including primary switches,
/// settings toggles, and various interactive states.
///
/// Example:
///   ```dart
///   Switch(
///     value: isEnabled,
///     onChanged: (value) => setState(() => isEnabled = value),
///   )
///   ```
class SwitchThemes {
  /// Default switch theme for the application
  /// Used as the base switch theme in ThemeData
  ///
  /// Example:
  ///   ```dart
  ///   ThemeData(
  ///     switchTheme: SwitchThemes.defaultSwitchTheme,
  ///   )
  ///   ```
  static SwitchThemeData get defaultSwitchTheme {
    return SwitchThemeData(
      // Thumb (the moving part) color
      thumbColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColors.disabledColor;
        }
        if (states.contains(WidgetState.selected)) {
          return AppColors.primaryColor;
        }
        return AppColors.subtextColor;
      }),

      // Track (the background) color
      trackColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColors.disabledColor.withOpacity(0.3);
        }
        if (states.contains(WidgetState.selected)) {
          return AppColors.primaryColor.withOpacity(0.5);
        }
        return AppColors.cardColor.withOpacity(0.5);
      }),

      // Track outline color
      trackOutlineColor: WidgetStateProperty.all(Colors.transparent),

      // Track outline width
      trackOutlineWidth: WidgetStateProperty.all(0.0),

      // Material tap target size
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

      // Mouse cursor
      mouseCursor: WidgetStateProperty.resolveWith<MouseCursor?>((states) {
        if (states.contains(WidgetState.disabled)) {
          return SystemMouseCursors.forbidden;
        }
        return SystemMouseCursors.click;
      }),
    );
  }

  /// Primary switch theme for important toggles
  ///
  /// Example:
  ///   ```dart
  ///   Theme(
  ///     data: Theme.of(context).copyWith(
  ///       switchTheme: SwitchThemes.primarySwitchTheme,
  ///     ),
  ///     child: Switch(value: value, onChanged: onChanged),
  ///   )
  ///   ```
  static SwitchThemeData get primarySwitchTheme {
    return SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColors.disabledColor;
        }
        if (states.contains(WidgetState.selected)) {
          return Colors.white;
        }
        return AppColors.subtextColor;
      }),
      trackColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColors.disabledColor.withOpacity(0.3);
        }
        if (states.contains(WidgetState.selected)) {
          return AppColors.primaryColor;
        }
        return AppColors.borderColor;
      }),
      trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
    );
  }

  /// Success switch theme for positive actions
  ///
  /// Example:
  ///   ```dart
  ///   Theme(
  ///     data: Theme.of(context).copyWith(
  ///       switchTheme: SwitchThemes.successSwitchTheme,
  ///     ),
  ///     child: Switch(value: isEnabled, onChanged: onToggle),
  ///   )
  ///   ```
  static SwitchThemeData get successSwitchTheme {
    return SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColors.disabledColor;
        }
        if (states.contains(WidgetState.selected)) {
          return Colors.white;
        }
        return AppColors.subtextColor;
      }),
      trackColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColors.disabledColor.withOpacity(0.3);
        }
        if (states.contains(WidgetState.selected)) {
          return AppColors.successColor;
        }
        return AppColors.borderColor;
      }),
      trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
    );
  }

  /// Gets a custom switch theme with specified colors
  ///
  /// Parameters:
  ///   - activeColor: The color when switch is active/selected
  ///   - inactiveColor: The color when switch is inactive
  ///   - thumbColor: The color of the switch thumb
  ///
  /// Returns:
  ///   - SwitchThemeData: Custom switch theme with specified colors
  ///
  /// Example:
  ///   ```dart
  ///   final customTheme = SwitchThemes.getCustomSwitchTheme(
  ///     activeColor: Colors.green,
  ///     inactiveColor: Colors.grey,
  ///   );
  ///   ```
  static SwitchThemeData getCustomSwitchTheme({
    required Color activeColor,
    required Color inactiveColor,
    Color? thumbColor,
  }) {
    return SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColors.disabledColor;
        }
        if (states.contains(WidgetState.selected)) {
          return thumbColor ?? Colors.white;
        }
        return thumbColor ?? AppColors.subtextColor;
      }),
      trackColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColors.disabledColor.withOpacity(0.3);
        }
        if (states.contains(WidgetState.selected)) {
          return activeColor;
        }
        return inactiveColor;
      }),
      trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
    );
  }
}

/// Button theme configurations for the UDM Downloader application.
/// Provides centralized button styling for consistent button appearance across the app.
///
/// This class contains button themes for different button types including elevated,
/// outlined, text buttons, and various interactive states.
///
/// Example:
///   ```dart
///   ElevatedButton(
///     onPressed: () {},
///     child: Text('Download'),
///   )
///   ```
class ButtonThemes {
  /// Default elevated button theme for the application
  /// Used as the base elevated button theme in ThemeData
  ///
  /// Example:
  ///   ```dart
  ///   ThemeData(
  ///     elevatedButtonTheme: ButtonThemes.elevatedButtonTheme,
  ///   )
  ///   ```
  static ElevatedButtonThemeData get elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        disabledBackgroundColor: AppColors.disabledColor,
        disabledForegroundColor: AppColors.subtextColor,

        // Elevation
        elevation: 2.0,

        // Padding
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 12.0,
        ),

        // Shape
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),

        // Text style
        textStyle: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
        ),

        // Minimum size
        minimumSize: const Size(88.0, 36.0),
      ),
    );
  }

  /// Default outlined button theme for the application
  ///
  /// Example:
  ///   ```dart
  ///   ThemeData(
  ///     outlinedButtonTheme: ButtonThemes.outlinedButtonTheme,
  ///   )
  ///   ```
  static OutlinedButtonThemeData get outlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primaryColor,
        disabledForegroundColor: AppColors.disabledColor,

        // Border
        side: const BorderSide(
          color: AppColors.primaryColor,
          width: 1.0,
        ),

        // Padding
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 12.0,
        ),

        // Shape
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),

        // Text style
        textStyle: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
        ),

        // Minimum size
        minimumSize: const Size(88.0, 36.0),
      ),
    );
  }

  /// Default text button theme for the application
  ///
  /// Example:
  ///   ```dart
  ///   ThemeData(
  ///     textButtonTheme: ButtonThemes.textButtonTheme,
  ///   )
  ///   ```
  static TextButtonThemeData get textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryColor,
        disabledForegroundColor: AppColors.disabledColor,

        // Padding
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),

        // Shape
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),

        // Text style
        textStyle: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
        ),

        // Minimum size
        minimumSize: const Size(64.0, 32.0),
      ),
    );
  }

  /// Icon button theme for the application
  ///
  /// Example:
  ///   ```dart
  ///   ThemeData(
  ///     iconButtonTheme: ButtonThemes.iconButtonTheme,
  ///   )
  ///   ```
  static IconButtonThemeData get iconButtonTheme {
    return IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: AppColors.subtextColor,
        disabledForegroundColor: AppColors.disabledColor,

        // Hover and focus colors
        backgroundColor: Colors.transparent,

        // Padding
        padding: const EdgeInsets.all(8.0),

        // Shape
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),

        // Minimum size
        minimumSize: const Size(40.0, 40.0),
      ),
    );
  }

  /// Gets a custom elevated button style
  ///
  /// Parameters:
  ///   - backgroundColor: The background color of the button
  ///   - foregroundColor: The text/icon color of the button
  ///   - borderRadius: The border radius of the button
  ///   - padding: The padding inside the button
  ///
  /// Returns:
  ///   - ButtonStyle: Custom button style with specified properties
  ///
  /// Example:
  ///   ```dart
  ///   ElevatedButton(
  ///     style: ButtonThemes.getCustomElevatedButtonStyle(
  ///       backgroundColor: Colors.green,
  ///       borderRadius: 12.0,
  ///     ),
  ///     onPressed: () {},
  ///     child: Text('Custom Button'),
  ///   )
  ///   ```
  static ButtonStyle getCustomElevatedButtonStyle({
    Color? backgroundColor,
    Color? foregroundColor,
    double? borderRadius,
    EdgeInsets? padding,
  }) {
    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor ?? AppColors.primaryColor,
      foregroundColor: foregroundColor ?? Colors.white,
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 12.0,
          ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
      ),
      textStyle: const TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  /// Gets a custom outlined button style
  ///
  /// Parameters:
  ///   - borderColor: The border color of the button
  ///   - foregroundColor: The text/icon color of the button
  ///   - borderRadius: The border radius of the button
  ///   - borderWidth: The width of the border
  ///
  /// Returns:
  ///   - ButtonStyle: Custom outlined button style with specified properties
  ///
  /// Example:
  ///   ```dart
  ///   OutlinedButton(
  ///     style: ButtonThemes.getCustomOutlinedButtonStyle(
  ///       borderColor: Colors.red,
  ///       foregroundColor: Colors.red,
  ///     ),
  ///     onPressed: () {},
  ///     child: Text('Cancel'),
  ///   )
  ///   ```
  static ButtonStyle getCustomOutlinedButtonStyle({
    Color? borderColor,
    Color? foregroundColor,
    double? borderRadius,
    double? borderWidth,
  }) {
    return OutlinedButton.styleFrom(
      foregroundColor: foregroundColor ?? AppColors.primaryColor,
      side: BorderSide(
        color: borderColor ?? AppColors.primaryColor,
        width: borderWidth ?? 1.0,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 12.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
      ),
      textStyle: const TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  /// Small button style for compact buttons
  ///
  /// Example:
  ///   ```dart
  ///   ElevatedButton(
  ///     style: ButtonThemes.smallButtonStyle,
  ///     onPressed: () {},
  ///     child: Text('Small'),
  ///   )
  ///   ```
  static ButtonStyle get smallButtonStyle {
    return ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      textStyle: const TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w500,
      ),
      minimumSize: const Size(64.0, 28.0),
    );
  }

  /// Large button style for prominent buttons
  ///
  /// Example:
  ///   ```dart
  ///   ElevatedButton(
  ///     style: ButtonThemes.largeButtonStyle,
  ///     onPressed: () {},
  ///     child: Text('Download Now'),
  ///   )
  ///   ```
  static ButtonStyle get largeButtonStyle {
    return ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: 32.0,
        vertical: 16.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      textStyle: const TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
      ),
      minimumSize: const Size(120.0, 48.0),
    );
  }
}
