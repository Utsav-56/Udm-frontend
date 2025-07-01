import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Text theme configurations for the UDM Downloader application.
/// Provides centralized text styling for consistent typography across the app.
///
/// This class contains text themes for both light and dark modes, with specific
/// styles for different text elements like headings, body text, labels, and captions.
///
/// Example:
///   ```dart
///   Text(
///     'Hello World',
///     style: TextThemes.bodyLarge,
///   )
///   ```
class TextThemes {
  /// Default font family used throughout the application
  static const String defaultFontFamily = 'Inter';

  /// Alternative font family for headings and emphasis
  static const String headingFontFamily = 'Inter';

  /// Monospace font family for code and technical content
  static const String monoFontFamily = 'JetBrains Mono';

  // Font Weights
  /// Light font weight for subtle text
  static const FontWeight lightWeight = FontWeight.w300;

  /// Regular font weight for body text
  static const FontWeight regularWeight = FontWeight.w400;

  /// Medium font weight for labels and captions
  static const FontWeight mediumWeight = FontWeight.w500;

  /// Semi-bold font weight for subheadings
  static const FontWeight semiBoldWeight = FontWeight.w600;

  /// Bold font weight for headings
  static const FontWeight boldWeight = FontWeight.w700;

  // Font Sizes
  /// Extra large display text size
  static const double displayLargeSize = 48.0;

  /// Large display text size
  static const double displayMediumSize = 32.0;

  /// Medium display text size
  static const double displaySmallSize = 24.0;

  /// Large heading text size
  static const double headlineLargeSize = 20.0;

  /// Medium heading text size
  static const double headlineMediumSize = 18.0;

  /// Small heading text size
  static const double headlineSmallSize = 16.0;

  /// Large title text size
  static const double titleLargeSize = 16.0;

  /// Medium title text size
  static const double titleMediumSize = 14.0;

  /// Small title text size
  static const double titleSmallSize = 12.0;

  /// Large body text size
  static const double bodyLargeSize = 14.0;

  /// Medium body text size
  static const double bodyMediumSize = 12.0;

  /// Small body text size
  static const double bodySmallSize = 11.0;

  /// Large label text size
  static const double labelLargeSize = 12.0;

  /// Medium label text size
  static const double labelMediumSize = 11.0;

  /// Small label text size
  static const double labelSmallSize = 10.0;

  /// Light theme text styles
  /// Used when the app is in light mode
  ///
  /// Example:
  ///   ```dart
  ///   ThemeData.light().copyWith(
  ///     textTheme: TextThemes.lightTextTheme,
  ///   )
  ///   ```
  static const TextTheme lightTextTheme = TextTheme(
    // Display styles for large numbers and showcased text
    displayLarge: TextStyle(
      fontSize: displayLargeSize,
      fontWeight: boldWeight,
      fontFamily: headingFontFamily,
      color: AppColors.scaffoldBackgroundColor,
    ),
    displayMedium: TextStyle(
      fontSize: displayMediumSize,
      fontWeight: boldWeight,
      fontFamily: headingFontFamily,
      color: AppColors.scaffoldBackgroundColor,
    ),
    displaySmall: TextStyle(
      fontSize: displaySmallSize,
      fontWeight: semiBoldWeight,
      fontFamily: headingFontFamily,
      color: AppColors.scaffoldBackgroundColor,
    ),

    // Headline styles for section headers
    headlineLarge: TextStyle(
      fontSize: headlineLargeSize,
      fontWeight: semiBoldWeight,
      fontFamily: headingFontFamily,
      color: AppColors.scaffoldBackgroundColor,
    ),
    headlineMedium: TextStyle(
      fontSize: headlineMediumSize,
      fontWeight: mediumWeight,
      fontFamily: defaultFontFamily,
      color: AppColors.scaffoldBackgroundColor,
    ),
    headlineSmall: TextStyle(
      fontSize: headlineSmallSize,
      fontWeight: mediumWeight,
      fontFamily: defaultFontFamily,
      color: AppColors.scaffoldBackgroundColor,
    ),

    // Title styles for card titles and important labels
    titleLarge: TextStyle(
      fontSize: titleLargeSize,
      fontWeight: mediumWeight,
      fontFamily: defaultFontFamily,
      color: AppColors.scaffoldBackgroundColor,
    ),
    titleMedium: TextStyle(
      fontSize: titleMediumSize,
      fontWeight: mediumWeight,
      fontFamily: defaultFontFamily,
      color: AppColors.scaffoldBackgroundColor,
    ),
    titleSmall: TextStyle(
      fontSize: titleSmallSize,
      fontWeight: regularWeight,
      fontFamily: defaultFontFamily,
      color: AppColors.scaffoldBackgroundColor,
    ),

    // Body styles for main content
    bodyLarge: TextStyle(
      fontSize: bodyLargeSize,
      fontWeight: regularWeight,
      fontFamily: defaultFontFamily,
      color: AppColors.scaffoldBackgroundColor,
    ),
    bodyMedium: TextStyle(
      fontSize: bodyMediumSize,
      fontWeight: regularWeight,
      fontFamily: defaultFontFamily,
      color: AppColors.scaffoldBackgroundColor,
    ),
    bodySmall: TextStyle(
      fontSize: bodySmallSize,
      fontWeight: regularWeight,
      fontFamily: defaultFontFamily,
      color: AppColors.scaffoldBackgroundColor,
    ),

    // Label styles for UI elements
    labelLarge: TextStyle(
      fontSize: labelLargeSize,
      fontWeight: mediumWeight,
      fontFamily: defaultFontFamily,
      color: AppColors.scaffoldBackgroundColor,
    ),
    labelMedium: TextStyle(
      fontSize: labelMediumSize,
      fontWeight: regularWeight,
      fontFamily: defaultFontFamily,
      color: AppColors.scaffoldBackgroundColor,
    ),
    labelSmall: TextStyle(
      fontSize: labelSmallSize,
      fontWeight: regularWeight,
      fontFamily: defaultFontFamily,
      color: AppColors.scaffoldBackgroundColor,
    ),
  );

  /// Dark theme text styles
  /// Used when the app is in dark mode (primary theme for UDM Downloader)
  ///
  /// Example:
  ///   ```dart
  ///   ThemeData.dark().copyWith(
  ///     textTheme: TextThemes.darkTextTheme,
  ///   )
  ///   ```
  static const TextTheme darkTextTheme = TextTheme(
    // Display styles for large numbers and showcased text
    displayLarge: TextStyle(
      fontSize: displayLargeSize,
      fontWeight: boldWeight,
      fontFamily: headingFontFamily,
      color: AppColors.textColor,
    ),
    displayMedium: TextStyle(
      fontSize: displayMediumSize,
      fontWeight: boldWeight,
      fontFamily: headingFontFamily,
      color: AppColors.textColor,
    ),
    displaySmall: TextStyle(
      fontSize: displaySmallSize,
      fontWeight: semiBoldWeight,
      fontFamily: headingFontFamily,
      color: AppColors.textColor,
    ),

    // Headline styles for section headers
    headlineLarge: TextStyle(
      fontSize: headlineLargeSize,
      fontWeight: semiBoldWeight,
      fontFamily: headingFontFamily,
      color: AppColors.textColor,
    ),
    headlineMedium: TextStyle(
      fontSize: headlineMediumSize,
      fontWeight: mediumWeight,
      fontFamily: defaultFontFamily,
      color: AppColors.textColor,
    ),
    headlineSmall: TextStyle(
      fontSize: headlineSmallSize,
      fontWeight: mediumWeight,
      fontFamily: defaultFontFamily,
      color: AppColors.textColor,
    ),

    // Title styles for card titles and important labels
    titleLarge: TextStyle(
      fontSize: titleLargeSize,
      fontWeight: semiBoldWeight,
      fontFamily: defaultFontFamily,
      color: AppColors.textColor,
    ),
    titleMedium: TextStyle(
      fontSize: titleMediumSize,
      fontWeight: mediumWeight,
      fontFamily: defaultFontFamily,
      color: AppColors.subtextColor,
    ),
    titleSmall: TextStyle(
      fontSize: titleSmallSize,
      fontWeight: regularWeight,
      fontFamily: defaultFontFamily,
      color: AppColors.subtextColor,
    ),

    // Body styles for main content
    bodyLarge: TextStyle(
      fontSize: bodyLargeSize,
      fontWeight: semiBoldWeight,
      fontFamily: defaultFontFamily,
      color: AppColors.textColor,
    ),
    bodyMedium: TextStyle(
      fontSize: bodyMediumSize,
      fontWeight: regularWeight,
      fontFamily: defaultFontFamily,
      color: AppColors.subtextColor,
    ),
    bodySmall: TextStyle(
      fontSize: bodySmallSize,
      fontWeight: regularWeight,
      fontFamily: defaultFontFamily,
      color: AppColors.subtextColor,
    ),

    // Label styles for UI elements
    labelLarge: TextStyle(
      fontSize: labelLargeSize,
      fontWeight: mediumWeight,
      fontFamily: defaultFontFamily,
      color: AppColors.textColor,
    ),
    labelMedium: TextStyle(
      fontSize: labelMediumSize,
      fontWeight: regularWeight,
      fontFamily: defaultFontFamily,
      color: AppColors.subtextColor,
    ),
    labelSmall: TextStyle(
      fontSize: labelSmallSize,
      fontWeight: regularWeight,
      fontFamily: defaultFontFamily,
      color: AppColors.subtextColor,
    ),
  );

  // Custom text styles for specific use cases

  /// Text style for large numbers and statistics
  ///
  /// Example:
  ///   ```dart
  ///   Text(
  ///     '25',
  ///     style: TextThemes.numberLarge,
  ///   )
  ///   ```
  static const TextStyle numberLarge = TextStyle(
    fontSize: displayLargeSize,
    fontWeight: boldWeight,
    fontFamily: headingFontFamily,
    color: AppColors.textColor,
  );

  /// Text style for medium numbers and counts
  ///
  /// Example:
  ///   ```dart
  ///   Text(
  ///     '156',
  ///     style: TextThemes.numberMedium,
  ///   )
  ///   ```
  static const TextStyle numberMedium = TextStyle(
    fontSize: displayMediumSize,
    fontWeight: boldWeight,
    fontFamily: headingFontFamily,
    color: AppColors.textColor,
  );

  /// Text style for card titles and section headers
  ///
  /// Example:
  ///   ```dart
  ///   Text(
  ///     'Total Downloads',
  ///     style: TextThemes.cardTitle,
  ///   )
  ///   ```
  static const TextStyle cardTitle = TextStyle(
    fontSize: titleMediumSize,
    fontWeight: mediumWeight,
    fontFamily: defaultFontFamily,
    color: AppColors.subtextColor,
  );

  /// Text style for list item titles
  ///
  /// Example:
  ///   ```dart
  ///   Text(
  ///     'Download Item',
  ///     style: TextThemes.listItemTitle,
  ///   )
  ///   ```
  static const TextStyle listItemTitle = TextStyle(
    fontSize: bodyLargeSize,
    fontWeight: semiBoldWeight,
    fontFamily: defaultFontFamily,
    color: AppColors.textColor,
  );

  /// Text style for list item subtitles and descriptions
  ///
  /// Example:
  ///   ```dart
  ///   Text(
  ///     'file.zip • 15.2 MB',
  ///     style: TextThemes.listItemSubtitle,
  ///   )
  ///   ```
  static const TextStyle listItemSubtitle = TextStyle(
    fontSize: bodyMediumSize,
    fontWeight: regularWeight,
    fontFamily: defaultFontFamily,
    color: AppColors.subtextColor,
  );

  /// Text style for button labels
  ///
  /// Example:
  ///   ```dart
  ///   Text(
  ///     'Download',
  ///     style: TextThemes.buttonText,
  ///   )
  ///   ```
  static const TextStyle buttonText = TextStyle(
    fontSize: titleMediumSize,
    fontWeight: mediumWeight,
    fontFamily: defaultFontFamily,
    color: AppColors.textColor,
  );

  /// Text style for input field hints and placeholders
  ///
  /// Example:
  ///   ```dart
  ///   TextField(
  ///     decoration: InputDecoration(
  ///       hintText: 'Enter URL',
  ///       hintStyle: TextThemes.inputHint,
  ///     ),
  ///   )
  ///   ```
  static const TextStyle inputHint = TextStyle(
    fontSize: bodyMediumSize,
    fontWeight: regularWeight,
    fontFamily: defaultFontFamily,
    color: AppColors.subtextColor,
  );

  /// Text style for error messages
  ///
  /// Example:
  ///   ```dart
  ///   Text(
  ///     'Download failed',
  ///     style: TextThemes.errorText,
  ///   )
  ///   ```
  static const TextStyle errorText = TextStyle(
    fontSize: bodySmallSize,
    fontWeight: regularWeight,
    fontFamily: defaultFontFamily,
    color: AppColors.errorColor,
  );

  /// Text style for success messages
  ///
  /// Example:
  ///   ```dart
  ///   Text(
  ///     'Download completed',
  ///     style: TextThemes.successText,
  ///   )
  ///   ```
  static const TextStyle successText = TextStyle(
    fontSize: bodySmallSize,
    fontWeight: regularWeight,
    fontFamily: defaultFontFamily,
    color: AppColors.successColor,
  );

  /// Gets a custom text style based on parameters
  ///
  /// Parameters:
  ///   - fontSize: The size of the text
  ///   - fontWeight: The weight of the text
  ///   - color: The color of the text
  ///   - fontFamily: The font family to use
  ///
  /// Returns:
  ///   - TextStyle: Custom text style with specified properties
  ///
  /// Example:
  ///   ```dart
  ///   final customStyle = TextThemes.getCustomTextStyle(
  ///     fontSize: 18.0,
  ///     fontWeight: FontWeight.bold,
  ///     color: Colors.blue,
  ///   );
  ///   ```
  static TextStyle getCustomTextStyle({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    String? fontFamily,
  }) {
    return TextStyle(
      fontSize: fontSize ?? bodyMediumSize,
      fontWeight: fontWeight ?? regularWeight,
      color: color ?? AppColors.textColor,
      fontFamily: fontFamily ?? defaultFontFamily,
    );
  }

  /// Gets a text style with applied opacity
  ///
  /// Parameters:
  ///   - baseStyle: The base text style to modify
  ///   - opacity: The opacity value (0.0 to 1.0)
  ///
  /// Returns:
  ///   - TextStyle: Text style with applied opacity
  ///
  /// Example:
  ///   ```dart
  ///   final fadedStyle = TextThemes.withOpacity(TextThemes.bodyLarge, 0.6);
  ///   ```
  static TextStyle withOpacity(TextStyle baseStyle, double opacity) {
    return baseStyle.copyWith(
      color: baseStyle.color?.withOpacity(opacity),
    );
  }
}
