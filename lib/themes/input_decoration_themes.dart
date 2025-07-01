import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Input decoration theme configurations for the UDM Downloader application.
/// Provides centralized input field styling for consistent form appearance across the app.
///
/// This class contains input decoration themes for different contexts including text fields,
/// search fields, and various input states like focused, error, and disabled.
///
/// Example:
///   ```dart
///   TextField(
///     decoration: InputDecorationThemes.defaultInputDecoration.copyWith(
///       labelText: 'Enter URL',
///     ),
///   )
///   ```
class InputDecorationThemes {
  /// Default border radius for input fields
  static const double defaultBorderRadius = 8.0;

  /// Large border radius for prominent input fields
  static const double largeBorderRadius = 12.0;

  /// Small border radius for compact input fields
  static const double smallBorderRadius = 6.0;

  /// Default border width for input fields
  static const double defaultBorderWidth = 1.0;

  /// Focused border width for active input fields
  static const double focusedBorderWidth = 2.0;

  /// Content padding for input fields
  static const EdgeInsets defaultContentPadding = EdgeInsets.symmetric(
    horizontal: 16.0,
    vertical: 12.0,
  );

  /// Compact content padding for smaller input fields
  static const EdgeInsets compactContentPadding = EdgeInsets.symmetric(
    horizontal: 12.0,
    vertical: 8.0,
  );

  /// Large content padding for prominent input fields
  static const EdgeInsets largeContentPadding = EdgeInsets.symmetric(
    horizontal: 20.0,
    vertical: 16.0,
  );

  /// Default input decoration theme for the application
  /// Used as the base input decoration theme in ThemeData
  ///
  /// Example:
  ///   ```dart
  ///   ThemeData(
  ///     inputDecorationTheme: InputDecorationThemes.defaultInputDecorationTheme,
  ///   )
  ///   ```
  static InputDecorationTheme get defaultInputDecorationTheme {
    return InputDecorationTheme(
      filled: true,
      fillColor: AppColors.inputBackgroundColor,
      contentPadding: defaultContentPadding,

      // Hint text styling
      hintStyle: const TextStyle(
        color: AppColors.subtextColor,
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
      ),

      // Label text styling
      labelStyle: const TextStyle(
        color: AppColors.subtextColor,
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
      ),

      // Floating label styling
      floatingLabelStyle: const TextStyle(
        color: AppColors.primaryColor,
        fontSize: 12.0,
        fontWeight: FontWeight.w500,
      ),

      // Icon styling
      prefixIconColor: AppColors.subtextColor,
      suffixIconColor: AppColors.subtextColor,
      iconColor: AppColors.subtextColor,

      // Border styling
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        borderSide: const BorderSide(
          color: AppColors.primaryColor,
          width: focusedBorderWidth,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        borderSide: const BorderSide(
          color: AppColors.errorColor,
          width: defaultBorderWidth,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        borderSide: const BorderSide(
          color: AppColors.errorColor,
          width: focusedBorderWidth,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        borderSide: const BorderSide(
          color: AppColors.disabledColor,
          width: defaultBorderWidth,
        ),
      ),

      // Error text styling
      errorStyle: const TextStyle(
        color: AppColors.errorColor,
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
      ),

      // Helper text styling
      helperStyle: const TextStyle(
        color: AppColors.subtextColor,
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  /// Outlined input decoration for fields that need visible borders
  ///
  /// Example:
  ///   ```dart
  ///   TextField(
  ///     decoration: InputDecorationThemes.outlinedInputDecoration.copyWith(
  ///       labelText: 'Email',
  ///     ),
  ///   )
  ///   ```
  static InputDecoration get outlinedInputDecoration {
    return InputDecoration(
      filled: false,
      contentPadding: defaultContentPadding,
      hintStyle: const TextStyle(
        color: AppColors.subtextColor,
        fontSize: 14.0,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        borderSide: const BorderSide(
          color: AppColors.borderColor,
          width: defaultBorderWidth,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        borderSide: const BorderSide(
          color: AppColors.borderColor,
          width: defaultBorderWidth,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        borderSide: const BorderSide(
          color: AppColors.primaryColor,
          width: focusedBorderWidth,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        borderSide: const BorderSide(
          color: AppColors.errorColor,
          width: defaultBorderWidth,
        ),
      ),
    );
  }

  /// Filled input decoration for fields with background fill
  ///
  /// Example:
  ///   ```dart
  ///   TextField(
  ///     decoration: InputDecorationThemes.filledInputDecoration.copyWith(
  ///       hintText: 'Search...',
  ///     ),
  ///   )
  ///   ```
  static InputDecoration get filledInputDecoration {
    return InputDecoration(
      filled: true,
      fillColor: AppColors.inputBackgroundColor,
      contentPadding: defaultContentPadding,
      hintStyle: const TextStyle(
        color: AppColors.subtextColor,
        fontSize: 14.0,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        borderSide: const BorderSide(
          color: AppColors.primaryColor,
          width: focusedBorderWidth,
        ),
      ),
    );
  }

  /// Search input decoration specifically designed for search fields
  ///
  /// Example:
  ///   ```dart
  ///   TextField(
  ///     decoration: InputDecorationThemes.searchInputDecoration,
  ///   )
  ///   ```
  static InputDecoration get searchInputDecoration {
    return InputDecoration(
      filled: true,
      fillColor: AppColors.inputBackgroundColor,
      contentPadding: defaultContentPadding,
      hintText: 'Search...',
      hintStyle: const TextStyle(
        color: AppColors.subtextColor,
        fontSize: 14.0,
      ),
      prefixIcon: const Icon(
        Icons.search,
        color: AppColors.subtextColor,
        size: 20.0,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(largeBorderRadius),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(largeBorderRadius),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(largeBorderRadius),
        borderSide: const BorderSide(
          color: AppColors.primaryColor,
          width: focusedBorderWidth,
        ),
      ),
    );
  }

  /// URL input decoration specifically designed for URL input fields
  ///
  /// Example:
  ///   ```dart
  ///   TextField(
  ///     decoration: InputDecorationThemes.urlInputDecoration,
  ///   )
  ///   ```
  static InputDecoration get urlInputDecoration {
    return InputDecoration(
      filled: true,
      fillColor: AppColors.inputBackgroundColor,
      contentPadding: largeContentPadding,
      hintText: 'Enter download URL...',
      hintStyle: const TextStyle(
        color: AppColors.subtextColor,
        fontSize: 14.0,
      ),
      prefixIcon: const Icon(
        Icons.link,
        color: AppColors.subtextColor,
        size: 20.0,
      ),
      suffixIcon: IconButton(
        icon: const Icon(
          Icons.paste,
          color: AppColors.primaryColor,
          size: 20.0,
        ),
        onPressed: () {
          // Paste functionality would be implemented here
        },
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        borderSide: const BorderSide(
          color: AppColors.primaryColor,
          width: focusedBorderWidth,
        ),
      ),
    );
  }

  /// Gets a custom input decoration with specified parameters
  ///
  /// Parameters:
  ///   - hintText: The hint text to display
  ///   - labelText: The label text to display
  ///   - prefixIcon: The prefix icon to display
  ///   - suffixIcon: The suffix icon to display
  ///   - filled: Whether the field should have a background fill
  ///   - borderRadius: The border radius for the field
  ///
  /// Returns:
  ///   - InputDecoration: Custom input decoration with specified properties
  ///
  /// Example:
  ///   ```dart
  ///   final customDecoration = InputDecorationThemes.getCustomInputDecoration(
  ///     hintText: 'Enter filename',
  ///     prefixIcon: Icons.file_present,
  ///     filled: true,
  ///   );
  ///   ```
  static InputDecoration getCustomInputDecoration({
    String? hintText,
    String? labelText,
    IconData? prefixIcon,
    Widget? suffixIcon,
    bool filled = true,
    double borderRadius = defaultBorderRadius,
  }) {
    return InputDecoration(
      filled: filled,
      fillColor: filled ? AppColors.inputBackgroundColor : null,
      contentPadding: defaultContentPadding,
      hintText: hintText,
      labelText: labelText,
      hintStyle: const TextStyle(
        color: AppColors.subtextColor,
        fontSize: 14.0,
      ),
      labelStyle: const TextStyle(
        color: AppColors.subtextColor,
        fontSize: 14.0,
      ),
      prefixIcon: prefixIcon != null
          ? Icon(
              prefixIcon,
              color: AppColors.subtextColor,
              size: 20.0,
            )
          : null,
      suffixIcon: suffixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: filled
            ? BorderSide.none
            : const BorderSide(
                color: AppColors.borderColor,
                width: defaultBorderWidth,
              ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: filled
            ? BorderSide.none
            : const BorderSide(
                color: AppColors.borderColor,
                width: defaultBorderWidth,
              ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: const BorderSide(
          color: AppColors.primaryColor,
          width: focusedBorderWidth,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: const BorderSide(
          color: AppColors.errorColor,
          width: defaultBorderWidth,
        ),
      ),
    );
  }

  /// Gets compact input decoration for smaller form fields
  ///
  /// Example:
  ///   ```dart
  ///   TextField(
  ///     decoration: InputDecorationThemes.getCompactInputDecoration('Port'),
  ///   )
  ///   ```
  static InputDecoration getCompactInputDecoration(String hintText) {
    return InputDecoration(
      filled: true,
      fillColor: AppColors.inputBackgroundColor,
      contentPadding: compactContentPadding,
      hintText: hintText,
      hintStyle: const TextStyle(
        color: AppColors.subtextColor,
        fontSize: 12.0,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(smallBorderRadius),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(smallBorderRadius),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(smallBorderRadius),
        borderSide: const BorderSide(
          color: AppColors.primaryColor,
          width: focusedBorderWidth,
        ),
      ),
    );
  }
}
