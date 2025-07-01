import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Card theme configurations for the UDM Downloader application.
/// Provides centralized card styling for consistent card appearance across the app.
///
/// This class contains card themes for different contexts including default cards,
/// elevated cards, outlined cards, and various interactive states.
///
/// Example:
///   ```dart
///   Card(
///     color: CardThemes.defaultCardColor,
///     elevation: CardThemes.defaultElevation,
///     shape: CardThemes.defaultShape,
///   )
///   ```
class CardThemes {
  /// Default card background color
  static const Color defaultCardColor = AppColors.cardColor;

  /// Primary card background color for highlighted cards
  static const Color primaryCardColor = AppColors.primaryColor;

  /// Surface card background color for elevated surfaces
  static const Color surfaceCardColor = AppColors.surfaceColor;

  /// Error card background color for error states
  static const Color errorCardColor = AppColors.errorColor;

  /// Success card background color for success states
  static const Color successCardColor = AppColors.successColor;

  /// Warning card background color for warning states
  static const Color warningCardColor = AppColors.warningColor;

  /// Default card elevation
  static const double defaultElevation = 0.0;

  /// Low card elevation for subtle depth
  static const double lowElevation = 2.0;

  /// Medium card elevation for moderate depth
  static const double mediumElevation = 4.0;

  /// High card elevation for prominent cards
  static const double highElevation = 8.0;

  /// Default border radius for cards
  static const double defaultBorderRadius = 12.0;

  /// Small border radius for compact cards
  static const double smallBorderRadius = 8.0;

  /// Large border radius for prominent cards
  static const double largeBorderRadius = 16.0;

  /// Default card padding
  static const double defaultCardPadding = 12.0;

  /// Small card padding for compact cards
  static const double smallCardPadding = 8.0;

  /// Large card padding for spacious cards
  static const double largeCardPadding = 16.0;

  /// Extra large card padding for very spacious cards
  static const double extraLargeCardPadding = 24.0;

  /// Default card margin
  static const double defaultCardMargin = 8.0;

  /// Small card margin for tight layouts
  static const double smallCardMargin = 4.0;

  /// Large card margin for spacious layouts
  static const double largeCardMargin = 16.0;

  /// Default card shape with rounded corners
  static RoundedRectangleBorder get defaultShape => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
      );

  /// Small card shape with smaller rounded corners
  static RoundedRectangleBorder get smallShape => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(smallBorderRadius),
      );

  /// Large card shape with larger rounded corners
  static RoundedRectangleBorder get largeShape => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(largeBorderRadius),
      );

  /// Outlined card shape with border
  static RoundedRectangleBorder get outlinedShape => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        side: const BorderSide(
          color: AppColors.borderColor,
          width: 1.0,
        ),
      );

  /// Default card theme for the application
  /// Used as the base card theme in ThemeData
  ///
  /// Example:
  ///   ```dart
  ///   ThemeData(
  ///     cardTheme: CardThemes.defaultCardTheme,
  ///   )
  ///   ```
  static CardTheme get defaultCardTheme => CardTheme(
        color: defaultCardColor,
        elevation: defaultElevation,
        shape: defaultShape,
        margin: const EdgeInsets.all(defaultCardMargin),
      );

  /// Elevated card theme for cards that need more prominence
  ///
  /// Example:
  ///   ```dart
  ///   Card(
  ///     elevation: CardThemes.elevatedCardTheme.elevation,
  ///     color: CardThemes.elevatedCardTheme.color,
  ///   )
  ///   ```
  static CardTheme get elevatedCardTheme => CardTheme(
        color: defaultCardColor,
        elevation: mediumElevation,
        shape: defaultShape,
        margin: const EdgeInsets.all(defaultCardMargin),
      );

  /// Outlined card theme for cards with borders
  ///
  /// Example:
  ///   ```dart
  ///   Card(
  ///     shape: CardThemes.outlinedCardTheme.shape,
  ///     elevation: CardThemes.outlinedCardTheme.elevation,
  ///   )
  ///   ```
  static CardTheme get outlinedCardTheme => CardTheme(
        color: Colors.transparent,
        elevation: 0.0,
        shape: outlinedShape,
        margin: const EdgeInsets.all(defaultCardMargin),
      );

  /// Primary card theme for highlighted important cards
  ///
  /// Example:
  ///   ```dart
  ///   Card(
  ///     color: CardThemes.primaryCardTheme.color,
  ///     elevation: CardThemes.primaryCardTheme.elevation,
  ///   )
  ///   ```
  static CardTheme get primaryCardTheme => CardTheme(
        color: primaryCardColor,
        elevation: lowElevation,
        shape: defaultShape,
        margin: const EdgeInsets.all(defaultCardMargin),
      );

  /// Gets a custom card theme with specified parameters
  ///
  /// Parameters:
  ///   - color: The background color for the card
  ///   - elevation: The elevation level for the card
  ///   - borderRadius: The border radius for the card corners
  ///   - margin: The margin around the card
  ///
  /// Returns:
  ///   - CardTheme: Custom card theme with specified properties
  ///
  /// Example:
  ///   ```dart
  ///   final customTheme = CardThemes.getCustomCardTheme(
  ///     color: Colors.blue,
  ///     elevation: 6.0,
  ///     borderRadius: 20.0,
  ///     margin: 12.0,
  ///   );
  ///   ```
  static CardTheme getCustomCardTheme({
    Color? color,
    double? elevation,
    double? borderRadius,
    double? margin,
  }) {
    return CardTheme(
      color: color ?? defaultCardColor,
      elevation: elevation ?? defaultElevation,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(borderRadius ?? defaultBorderRadius),
      ),
      margin: EdgeInsets.all(margin ?? defaultCardMargin),
    );
  }

  /// Gets a card decoration for use with Container widgets
  ///
  /// Parameters:
  ///   - color: The background color for the card
  ///   - borderRadius: The border radius for the card corners
  ///   - hasBorder: Whether to include a border
  ///
  /// Returns:
  ///   - BoxDecoration: Decoration matching card theme styles
  ///
  /// Example:
  ///   ```dart
  ///   Container(
  ///     decoration: CardThemes.getCardDecoration(),
  ///     child: Text('Card content'),
  ///   )
  ///   ```
  static BoxDecoration getCardDecoration({
    Color? color,
    double? borderRadius,
    bool hasBorder = false,
  }) {
    return BoxDecoration(
      color: color ?? defaultCardColor,
      borderRadius: BorderRadius.circular(borderRadius ?? defaultBorderRadius),
      border: hasBorder
          ? Border.all(
              color: AppColors.borderColor,
              width: 1.0,
            )
          : null,
    );
  }

  /// Gets card padding based on size preference
  ///
  /// Parameters:
  ///   - size: The size category ('small', 'medium', 'large', 'extra-large')
  ///
  /// Returns:
  ///   - EdgeInsets: Appropriate padding for the specified size
  ///
  /// Example:
  ///   ```dart
  ///   Padding(
  ///     padding: CardThemes.getCardPadding('large'),
  ///     child: Text('Padded content'),
  ///   )
  ///   ```
  static EdgeInsets getCardPadding(String size) {
    switch (size.toLowerCase()) {
      case 'small':
        return const EdgeInsets.all(smallCardPadding);
      case 'large':
        return const EdgeInsets.all(largeCardPadding);
      case 'extra-large':
        return const EdgeInsets.all(extraLargeCardPadding);
      case 'medium':
      default:
        return const EdgeInsets.all(defaultCardPadding);
    }
  }

  /// Gets card margin based on size preference
  ///
  /// Parameters:
  ///   - size: The size category ('small', 'medium', 'large')
  ///
  /// Returns:
  ///   - EdgeInsets: Appropriate margin for the specified size
  ///
  /// Example:
  ///   ```dart
  ///   Card(
  ///     margin: CardThemes.getCardMargin('small'),
  ///   )
  ///   ```
  static EdgeInsets getCardMargin(String size) {
    switch (size.toLowerCase()) {
      case 'small':
        return const EdgeInsets.all(smallCardMargin);
      case 'large':
        return const EdgeInsets.all(largeCardMargin);
      case 'medium':
      default:
        return const EdgeInsets.all(defaultCardMargin);
    }
  }
}
