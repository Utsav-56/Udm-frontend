// ignore_for_file: file_names, avoid_print
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Import all theme components
import 'app_colors.dart';
import 'text_themes.dart';
import 'icon_themes.dart';
import 'card_themes.dart';
import 'input_decoration_themes.dart';
import 'component_themes.dart';

/// Main application theme class for the UDM Downloader application.
/// Combines all theme components into cohesive light and dark themes.
///
/// This class serves as the central theme configuration, bringing together
/// colors, typography, icons, cards, inputs, and other UI components into
/// a unified design system.
///
/// Example:
///   ```dart
///   MaterialApp(
///     theme: AppTheme.lightTheme,
///     darkTheme: AppTheme.darkTheme,
///     themeMode: ThemeMode.dark, // UDM primarily uses dark theme
///   )
///   ```
class AppTheme {
  // Legacy constants from original theme (maintained for backward compatibility)
  /// Primary brand color used for main actions and highlights
  static const Color primaryColor = AppColors.primaryColor;

  /// Main background color for the application
  static const Color scaffoldBackgroundColor =
      AppColors.scaffoldBackgroundColor;

  /// Background color for cards and elevated surfaces
  static const Color cardColor = AppColors.cardColor;

  /// Primary text color for high contrast readability
  static const Color textColor = AppColors.textColor;

  /// Secondary text color for less prominent text
  static const Color subtextColor = AppColors.subtextColor;

  /// Secondary color used for supporting elements
  static const Color secondaryColor = AppColors.secondaryColor;

  // Toolbar specific configs
  /// Icon size for toolbar elements
  static const double toolbarIconSize = IconThemes.toolbarIconSize;

  /// Height of the application toolbar
  static const double toolbarHeight = 65.0;

  /// Text size for toolbar elements
  static const double toolbarTextSize = 14;

  /// Icon size for toolbar buttons
  static const double toolbarButtonIconSize = IconThemes.toolbarButtonIconSize;

  // Side navigation specific configs
  /// Text size for side navigation elements
  static const double sideNavTextSize = 14;

  /// Icon size for side navigation elements
  static const double sideNavIconSize = IconThemes.sideNavIconSize;

  /// Whether to show labels in the navigation bar
  static const bool showNavbarLabels = false;

  /// Width of the side navigation when collapsed
  static const double sideNavWidth = 65.0;

  /// Width of the side navigation when expanded
  static const double sideNavWidthExpanded = 250.0;

  /// Height of side navigation items
  static const double sideNavItemHeight = 40.0;

  // General app theme configs
  /// Primary icon color
  static const Color iconPrimaryColor = AppColors.primaryColor;

  /// Primary button color
  static const Color buttonPrimaryColor = AppColors.buttonPrimaryColor;

  /// Secondary button color
  static const Color buttonSecondaryColor = AppColors.buttonSecondaryColor;

  /// Secondary text color for accent elements
  static const Color secondaryTextColor = AppColors.secondaryTextColor;

  /// Default page padding
  static const double pagePadding = 16.0;

  /// Default card padding
  static const double cardPadding = CardThemes.defaultCardPadding;

  /// Dark theme for the UDM Downloader application.
  /// This is the primary theme used throughout the application.
  ///
  /// Features:
  /// - Dark background with blue accent colors
  /// - High contrast text for readability
  /// - Consistent card and button styling
  /// - Custom input field decorations
  /// - Google Fonts (Inter) typography
  ///
  /// Example:
  ///   ```dart
  ///   MaterialApp(
  ///     theme: AppTheme.darkTheme,
  ///     home: MyHomePage(),
  ///   )
  ///   ```
  static ThemeData get darkTheme {
    return ThemeData(
      // Basic theme properties
      primaryColor: primaryColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      canvasColor: scaffoldBackgroundColor,
      brightness: Brightness.dark,

      // Color scheme
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryColor,
        secondary: AppColors.secondaryColor,
        surface: AppColors.cardColor,
        error: AppColors.errorColor,
        onPrimary: Colors.white,
        onSecondary: AppColors.textColor,
        onSurface: AppColors.textColor,
        onError: Colors.white,
      ),

      // Card theme
      cardTheme: CardThemeData(
        color: cardColor,
        elevation: CardThemes.defaultElevation,
        shape: CardThemes.defaultShape,
        margin: CardThemes.getCardMargin('medium'),
      ),

      // Icon theme
      iconTheme: IconThemes.defaultIconTheme,
      primaryIconTheme: IconThemes.primaryIconTheme,

      // Text theme with Google Fonts
      textTheme: GoogleFonts.interTextTheme(
        ThemeData.dark().textTheme,
      ).copyWith(
        // For large numbers like 11, 20, 13
        displayMedium: const TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: TextThemes.displayMediumSize,
        ),
        // For card titles like "Total Downloads"
        titleMedium: const TextStyle(
          color: subtextColor,
          fontWeight: FontWeight.w500,
          fontSize: TextThemes.titleMediumSize,
        ),
        // For list item titles
        bodyLarge: const TextStyle(
          color: textColor,
          fontWeight: FontWeight.w600,
          fontSize: TextThemes.bodyLargeSize,
        ),
        // For list item subtitles
        bodyMedium: const TextStyle(
          color: subtextColor,
          fontSize: TextThemes.bodyMediumSize,
        ),
        // Additional custom styles
        headlineLarge: const TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: TextThemes.headlineLargeSize,
        ),
        titleLarge: const TextStyle(
          color: textColor,
          fontWeight: FontWeight.w600,
          fontSize: TextThemes.titleLargeSize,
        ),
        labelLarge: const TextStyle(
          color: textColor,
          fontWeight: FontWeight.w500,
          fontSize: TextThemes.labelLargeSize,
        ),
      ),

      // Input decoration theme
      inputDecorationTheme: InputDecorationThemes.defaultInputDecorationTheme,

      // Switch theme
      switchTheme: SwitchThemes.defaultSwitchTheme,

      // Button themes
      elevatedButtonTheme: ButtonThemes.elevatedButtonTheme,
      outlinedButtonTheme: ButtonThemes.outlinedButtonTheme,
      textButtonTheme: ButtonThemes.textButtonTheme,
      iconButtonTheme: ButtonThemes.iconButtonTheme,

      // App bar theme
      appBarTheme: AppBarTheme(
        backgroundColor: scaffoldBackgroundColor,
        foregroundColor: textColor,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.inter(
          color: textColor,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemes.toolbarIconTheme,
      ),

      // Bottom navigation theme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.cardColor,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.subtextColor,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),

      // Navigation rail theme
      navigationRailTheme: const NavigationRailThemeData(
        backgroundColor: AppColors.cardColor,
        selectedIconTheme: IconThemes.navigationIconTheme,
        unselectedIconTheme: IconThemes.defaultIconTheme,
        selectedLabelTextStyle: TextStyle(
          color: AppColors.primaryColor,
          fontSize: TextThemes.labelMediumSize,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelTextStyle: TextStyle(
          color: AppColors.subtextColor,
          fontSize: TextThemes.labelMediumSize,
        ),
      ),

      // Drawer theme
      drawerTheme: const DrawerThemeData(
        backgroundColor: AppColors.cardColor,
        elevation: 0,
      ),

      // Dialog theme
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.cardColor,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        titleTextStyle: GoogleFonts.inter(
          color: textColor,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        contentTextStyle: GoogleFonts.inter(
          color: textColor,
          fontSize: 14,
        ),
      ),

      // Floating action button theme
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        elevation: 4,
      ),

      // Chip theme
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.cardColor,
        selectedColor: AppColors.primaryColor.withOpacity(0.2),
        disabledColor: AppColors.disabledColor,
        labelStyle: const TextStyle(
          color: AppColors.textColor,
          fontSize: TextThemes.labelMediumSize,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),

      // Progress indicator theme
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primaryColor,
        linearTrackColor: AppColors.borderColor,
        circularTrackColor: AppColors.borderColor,
      ),

      // Slider theme
      sliderTheme: SliderThemeData(
        activeTrackColor: AppColors.primaryColor,
        inactiveTrackColor: AppColors.borderColor,
        thumbColor: AppColors.primaryColor,
        overlayColor: AppColors.primaryColor.withOpacity(0.2),
        valueIndicatorColor: AppColors.primaryColor,
        valueIndicatorTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: TextThemes.labelSmallSize,
        ),
      ),

      // Tab bar theme
      tabBarTheme: TabBarThemeData(
        labelColor: AppColors.primaryColor,
        unselectedLabelColor: AppColors.subtextColor,
        indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 2,
          ),
        ),
        labelStyle: GoogleFonts.inter(
          fontSize: TextThemes.titleMediumSize,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: GoogleFonts.inter(
          fontSize: TextThemes.titleMediumSize,
          fontWeight: FontWeight.w400,
        ),
      ),

      // Tooltip theme
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: AppColors.surfaceColor,
          borderRadius: BorderRadius.circular(6),
        ),
        textStyle: const TextStyle(
          color: AppColors.textColor,
          fontSize: TextThemes.labelSmallSize,
        ),
      ),

      // Divider theme
      dividerTheme: const DividerThemeData(
        color: AppColors.borderColor,
        thickness: 1,
        space: 1,
      ),
    );
  }

  /// Light theme for the UDM Downloader application.
  /// Provided for accessibility and user preference, though dark theme is primary.
  ///
  /// Example:
  ///   ```dart
  ///   MaterialApp(
  ///     theme: AppTheme.lightTheme,
  ///     home: MyHomePage(),
  ///   )
  ///   ```
  static ThemeData get lightTheme {
    return ThemeData(
      // Basic theme properties
      primaryColor: primaryColor,
      scaffoldBackgroundColor: Colors.white,
      canvasColor: Colors.white,
      brightness: Brightness.light,

      // Color scheme
      colorScheme: const ColorScheme.light(
        primary: AppColors.primaryColor,
        secondary: AppColors.secondaryColor,
        surface: Colors.white,
        error: AppColors.errorColor,
        onPrimary: Colors.white,
        onSecondary: AppColors.scaffoldBackgroundColor,
        onSurface: AppColors.scaffoldBackgroundColor,
        onError: Colors.white,
      ),

      // Card theme
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: CardThemes.lowElevation,
        shape: CardThemes.defaultShape,
        shadowColor: Colors.black.withOpacity(0.1),
      ),

      // Icon theme
      iconTheme: const IconThemeData(
        color: AppColors.scaffoldBackgroundColor,
        size: IconThemes.defaultIconSize,
      ),

      // Text theme with Google Fonts
      textTheme: GoogleFonts.interTextTheme(
        TextThemes.lightTextTheme,
      ),

      // Input decoration theme (modified for light theme)
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey.shade50,
        hintStyle: TextStyle(color: Colors.grey.shade600),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
            width: 2.0,
          ),
        ),
      ),

      // App bar theme
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.scaffoldBackgroundColor,
        elevation: 1,
        shadowColor: Colors.black.withOpacity(0.1),
        titleTextStyle: GoogleFonts.inter(
          color: AppColors.scaffoldBackgroundColor,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// Gets the current theme mode preference
  /// Defaults to dark theme as it's the primary theme for UDM
  ///
  /// Returns:
  ///   - ThemeMode: The preferred theme mode
  ///
  /// Example:
  ///   ```dart
  ///   MaterialApp(
  ///     themeMode: AppTheme.themeMode,
  ///   )
  ///   ```
  static ThemeMode get themeMode => ThemeMode.dark;

  /// Checks if the current theme is dark
  ///
  /// Parameters:
  ///   - context: The build context to check theme from
  ///
  /// Returns:
  ///   - bool: True if dark theme is active
  ///
  /// Example:
  ///   ```dart
  ///   if (AppTheme.isDarkMode(context)) {
  ///     // Use dark-specific styling
  ///   }
  ///   ```
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  /// Gets the current primary color based on theme
  ///
  /// Parameters:
  ///   - context: The build context to get theme from
  ///
  /// Returns:
  ///   - Color: The primary color for the current theme
  ///
  /// Example:
  ///   ```dart
  ///   Container(
  ///     color: AppTheme.getPrimaryColor(context),
  ///   )
  ///   ```
  static Color getPrimaryColor(BuildContext context) {
    return Theme.of(context).primaryColor;
  }

  /// Gets the current background color based on theme
  ///
  /// Parameters:
  ///   - context: The build context to get theme from
  ///
  /// Returns:
  ///   - Color: The background color for the current theme
  ///
  /// Example:
  ///   ```dart
  ///   Container(
  ///     color: AppTheme.getBackgroundColor(context),
  ///   )
  ///   ```
  static Color getBackgroundColor(BuildContext context) {
    return Theme.of(context).scaffoldBackgroundColor;
  }

  /// Gets the current text color based on theme
  ///
  /// Parameters:
  ///   - context: The build context to get theme from
  ///
  /// Returns:
  ///   - Color: The primary text color for the current theme
  ///
  /// Example:
  ///   ```dart
  ///   Text(
  ///     'Hello',
  ///     style: TextStyle(color: AppTheme.getTextColor(context)),
  ///   )
  ///   ```
  static Color getTextColor(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge?.color ?? textColor;
  }
}
