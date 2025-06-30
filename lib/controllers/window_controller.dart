//ignore_for_file: unused_import, unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import 'package:window_manager/window_manager.dart';

/// Controller class for managing Flutter desktop application window properties and behavior.
/// Provides comprehensive window management functionality including size, position,
/// visibility, and various window states.
///
/// This class wraps the window_manager plugin to provide a convenient API for
/// common window operations in the UDM Downloader application.
///
/// Example:
///   ```dart
///   // Initialize window with default settings
///   await WindowController.setDefaultAppSize();
///
///   // Change window size
///   await WindowController.changeCurrentWindowSize(const Size(800, 600));
///
///   // Center the window
///   await WindowController.setWindowOnCenter();
///   ```
class WindowController {
  /// Default window configuration options for the UDM Downloader application.
  /// These values are used as fallback settings when restoring default window state.
  ///
  /// Properties:
  ///   - size: Default window dimensions (625x300)
  ///   - center: Whether to center the window on screen
  ///   - backgroundColor: Window background color (transparent)
  ///   - title: Default window title
  ///   - minimumSize: Minimum allowed window size (550x280)
  ///   - maximumSize: Maximum allowed window size (650x420)
  ///   - fullScreen: Whether to start in fullscreen mode
  ///   - alwaysOnTop: Whether window should stay on top of others
  ///   - windowButtonVisibility: Whether to show window control buttons
  static Map<String, dynamic> defaultWindowOptions = {
    'size': const Size(625, 300),
    'center': true,
    'backgroundColor': Colors.transparent,
    'title': 'UDM Downloader',
    'minimumSize': const Size(550, 280),
    'maximumSize': const Size(650, 420),
    'fullScreen': false,
    'alwaysOnTop': false,
    'windowButtonVisibility': true,
  };

  // On before close is a callback method that is triggered when the window is about to close.
  /// This method can be used to perform cleanup or save state before the window is closed.
  /// by default it does nothing, but you can override it to implement custom behavior.
  /// /// Example:
  ///   ```dart
  ///  //   windowManager.onBeforeClose = () async {
  /// ///   //     // Perform cleanup or save state
  /// /// ///     //   print('Window is about to close');
  /// ///   //   };
  ///  ///   ```

  static void Function()? _onStart;

  /// Sets a callback function to be executed when the window is ready to show.
  /// This is useful for initializing the window with specific settings or state.
  /// /// Example:
  ///   ```dart
  /// ///   WindowController.onStart = () {
  /// ///     // Perform any setup needed before showing the window
  /// /// ///     print('Window is ready to show');
  /// /// ///   };
  ///  /// ///   ```
  /// or additionally via a setter method ::
  /// ///   ```dart
  /// ///   WindowController.setOnStart(() {
  /// ///     // Perform any setup needed before showing the window
  ///   /// ///     print('Window is ready to show');
  /// /// ///   });
  static setonStart(void Function() callback) {
    _onStart = callback;
  }

  /// Initializes the window with default application size and settings.
  /// This method should be called during app startup to establish the initial window state.
  /// The window will be centered, focused, and shown with downloading title.
  ///
  /// Example:
  ///   ```dart
  ///   void main() async {
  ///     WidgetsFlutterBinding.ensureInitialized();
  ///     await WindowController.setDefaultAppSize();
  ///     runApp(MyApp());
  ///   }
  ///   ```
  static Future<void> setDefaultAppSize() async {
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = const WindowOptions(
      size: Size(625, 300),
      center: true,
      backgroundColor: Colors.transparent,
      title: 'Downloading...',
      minimumSize: Size(550, 280),
      maximumSize: Size(650, 420),
      fullScreen: false,
      alwaysOnTop: false,
      windowButtonVisibility: true,
    );

    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.setSize(const Size(625, 300));

      await windowManager.show();
      await windowManager.focus();
    });

    // Set the window size and position
  }

  /// Changes the current window size to the specified dimensions.
  /// This is a simple wrapper around the window manager's setSize method.
  ///
  /// Parameters:
  ///   - size: The new size for the window
  ///
  /// Example:
  ///   ```dart
  ///   await WindowController.setWindowSize(const Size(800, 600));
  ///   ```
  static Future<void> setWindowSize(Size size) async {
    await windowManager.setSize(size);
  }

  /// Changes the current window size with validation and error handling.
  /// This method provides a more robust way to change window size compared to setWindowSize.
  ///
  /// Parameters:
  ///   - size: The new size for the window
  ///
  /// Example:
  ///   ```dart
  ///   await WindowController.changeCurrentWindowSize(const Size(1024, 768));
  ///   ```
  static Future<void> changeCurrentWindowSize(Size size) async {
    try {
      await windowManager.setSize(size);
    } catch (e) {
      print('Error changing window size: $e');
    }
  }

  /// Sets the window to the center of the screen.
  /// Useful for repositioning the window after size changes or for better user experience.
  ///
  /// Example:
  ///   ```dart
  ///   await WindowController.setWindowOnCenter();
  ///   ```
  static Future<void> setWindowOnCenter() async {
    try {
      await windowManager.center();
    } catch (e) {
      print('Error centering window: $e');
    }
  }

  /// Restores the window to its default configuration.
  /// Uses the values from defaultWindowOptions to reset all window properties.
  ///
  /// Example:
  ///   ```dart
  ///   // Restore window to default state
  ///   await WindowController.restoreDefaultWindowOptions();
  ///   ```
  static Future<void> restoreDefaultWindowOptions() async {
    try {
      await windowManager.ensureInitialized();

      final defaultSize = defaultWindowOptions['size'] as Size;
      final defaultMinSize = defaultWindowOptions['minimumSize'] as Size;
      final defaultMaxSize = defaultWindowOptions['maximumSize'] as Size;
      final defaultTitle = defaultWindowOptions['title'] as String;

      await windowManager.setSize(defaultSize);
      await windowManager.setMinimumSize(defaultMinSize);
      await windowManager.setMaximumSize(defaultMaxSize);
      await windowManager.setTitle(defaultTitle);

      if (defaultWindowOptions['center'] as bool) {
        await windowManager.center();
      }

      await windowManager
          .setAlwaysOnTop(defaultWindowOptions['alwaysOnTop'] as bool);
    } catch (e) {
      print('Error restoring default window options: $e');
    }
  }

  /// Sets the minimum window size constraints.
  ///
  /// Parameters:
  ///   - size: The minimum size the window can be resized to
  ///
  /// Example:
  ///   ```dart
  ///   await WindowController.setMinimumSize(const Size(400, 300));
  ///   ```
  static Future<void> setMinimumSize(Size size) async {
    try {
      await windowManager.setMinimumSize(size);
    } catch (e) {
      print('Error setting minimum window size: $e');
    }
  }

  /// Sets the maximum window size constraints.
  ///
  /// Parameters:
  ///   - size: The maximum size the window can be resized to
  ///
  /// Example:
  ///   ```dart
  ///   await WindowController.setMaximumSize(const Size(1920, 1080));
  ///   ```
  static Future<void> setMaximumSize(Size size) async {
    try {
      await windowManager.setMaximumSize(size);
    } catch (e) {
      print('Error setting maximum window size: $e');
    }
  }

  /// Sets both minimum and maximum window size constraints.
  ///
  /// Parameters:
  ///   - minSize: The minimum size the window can be resized to
  ///   - maxSize: The maximum size the window can be resized to
  ///
  /// Example:
  ///   ```dart
  ///   await WindowController.setSizeConstraints(
  ///     const Size(400, 300),
  ///     const Size(1920, 1080)
  ///   );
  ///   ```
  static Future<void> setSizeConstraints(Size minSize, Size maxSize) async {
    try {
      await windowManager.setMinimumSize(minSize);
      await windowManager.setMaximumSize(maxSize);
    } catch (e) {
      print('Error setting window size constraints: $e');
    }
  }

  /// Sets the window position on the screen.
  ///
  /// Parameters:
  ///   - position: The position offset from the top-left corner of the screen
  ///
  /// Example:
  ///   ```dart
  ///   await WindowController.setWindowPosition(const Offset(100, 100));
  ///   ```
  static Future<void> setWindowPosition(Offset position) async {
    try {
      await windowManager.setPosition(position);
    } catch (e) {
      print('Error setting window position: $e');
    }
  }

  /// Gets the current window position.
  ///
  /// Returns:
  ///   - Offset: The current position of the window
  ///
  /// Example:
  ///   ```dart
  ///   final position = await WindowController.getWindowPosition();
  ///   print('Window is at: ${position.dx}, ${position.dy}');
  ///   ```
  static Future<Offset> getWindowPosition() async {
    try {
      return await windowManager.getPosition();
    } catch (e) {
      print('Error getting window position: $e');
      return Offset.zero;
    }
  }

  /// Gets the current window size.
  ///
  /// Returns:
  ///   - Size: The current size of the window
  ///
  /// Example:
  ///   ```dart
  ///   final size = await WindowController.getCurrentWindowSize();
  ///   print('Window size: ${size.width}x${size.height}');
  ///   ```
  static Future<Size> getCurrentWindowSize() async {
    try {
      return await windowManager.getSize();
    } catch (e) {
      print('Error getting current window size: $e');
      return const Size(625, 300); // Return default size on error
    }
  }

  /// Sets whether the window should always stay on top of other windows.
  ///
  /// Parameters:
  ///   - alwaysOnTop: Whether the window should stay on top
  ///
  /// Example:
  ///   ```dart
  ///   await WindowController.setAlwaysOnTop(true);
  ///   ```
  static Future<void> setAlwaysOnTop(bool alwaysOnTop) async {
    try {
      await windowManager.setAlwaysOnTop(alwaysOnTop);
    } catch (e) {
      print('Error setting always on top: $e');
    }
  }

  /// Minimizes the window to the taskbar.
  ///
  /// Example:
  ///   ```dart
  ///   await WindowController.minimizeWindow();
  ///   ```
  static Future<void> minimizeWindow() async {
    try {
      await windowManager.minimize();
    } catch (e) {
      print('Error minimizing window: $e');
    }
  }

  /// Maximizes the window to fill the screen.
  ///
  /// Example:
  ///   ```dart
  ///   await WindowController.maximizeWindow();
  ///   ```
  static Future<void> maximizeWindow() async {
    try {
      await windowManager.maximize();
    } catch (e) {
      print('Error maximizing window: $e');
    }
  }

  /// Restores the window from minimized or maximized state.
  ///
  /// Example:
  ///   ```dart
  ///   await WindowController.restoreWindow();
  ///   ```
  static Future<void> restoreWindow() async {
    try {
      await windowManager.restore();
    } catch (e) {
      print('Error restoring window: $e');
    }
  }

  /// Hides the window from view without closing it.
  ///
  /// Example:
  ///   ```dart
  ///   await WindowController.hideWindow();
  ///   ```
  static Future<void> hideWindow() async {
    try {
      await windowManager.hide();
    } catch (e) {
      print('Error hiding window: $e');
    }
  }

  /// Shows the window if it was previously hidden.
  ///
  /// Example:
  ///   ```dart
  ///   await WindowController.showWindow();
  ///   ```
  static Future<void> showWindow() async {
    try {
      await windowManager.show();
    } catch (e) {
      print('Error showing window: $e');
    }
  }

  /// Brings the window to the front and gives it focus.
  ///
  /// Example:
  ///   ```dart
  ///   await WindowController.focusWindow();
  ///   ```
  static Future<void> focusWindow() async {
    try {
      await windowManager.focus();
    } catch (e) {
      print('Error focusing window: $e');
    }
  }

  /// Checks if the window is currently maximized.
  ///
  /// Returns:
  ///   - bool: True if the window is maximized, false otherwise
  ///
  /// Example:
  ///   ```dart
  ///   final isMaximized = await WindowController.isWindowMaximized();
  ///   if (isMaximized) {
  ///     print('Window is currently maximized');
  ///   }
  ///   ```
  static Future<bool> isWindowMaximized() async {
    try {
      return await windowManager.isMaximized();
    } catch (e) {
      print('Error checking if window is maximized: $e');
      return false;
    }
  }

  /// Checks if the window is currently minimized.
  ///
  /// Returns:
  ///   - bool: True if the window is minimized, false otherwise
  ///
  /// Example:
  ///   ```dart
  ///   final isMinimized = await WindowController.isWindowMinimized();
  ///   if (isMinimized) {
  ///     await WindowController.restoreWindow();
  ///   }
  ///   ```
  static Future<bool> isWindowMinimized() async {
    try {
      return await windowManager.isMinimized();
    } catch (e) {
      print('Error checking if window is minimized: $e');
      return false;
    }
  }

  /// Checks if the window is currently visible.
  ///
  /// Returns:
  ///   - bool: True if the window is visible, false otherwise
  ///
  /// Example:
  ///   ```dart
  ///   final isVisible = await WindowController.isWindowVisible();
  ///   if (!isVisible) {
  ///     await WindowController.showWindow();
  ///   }
  ///   ```
  static Future<bool> isWindowVisible() async {
    try {
      return await windowManager.isVisible();
    } catch (e) {
      print('Error checking if window is visible: $e');
      return false;
    }
  }

  /// Sets the window to fullscreen mode or exits fullscreen.
  ///
  /// Parameters:
  ///   - fullscreen: Whether to enter fullscreen mode
  ///
  /// Example:
  ///   ```dart
  ///   await WindowController.setFullscreen(true);  // Enter fullscreen
  ///   await WindowController.setFullscreen(false); // Exit fullscreen
  ///   ```
  static Future<void> setFullscreen(bool fullscreen) async {
    try {
      await windowManager.setFullScreen(fullscreen);
    } catch (e) {
      print('Error setting fullscreen mode: $e');
    }
  }

  /// Checks if the window is currently in fullscreen mode.
  ///
  /// Returns:
  ///   - bool: True if the window is in fullscreen, false otherwise
  ///
  /// Example:
  ///   ```dart
  ///   final isFullscreen = await WindowController.isFullscreen();
  ///   if (isFullscreen) {
  ///     print('Window is in fullscreen mode');
  ///   }
  ///   ```
  static Future<bool> isFullscreen() async {
    try {
      return await windowManager.isFullScreen();
    } catch (e) {
      print('Error checking fullscreen status: $e');
      return false;
    }
  }

  /// Sets the window's resizable property.
  ///
  /// Parameters:
  ///   - resizable: Whether the window should be resizable by the user
  ///
  /// Example:
  ///   ```dart
  ///   await WindowController.setResizable(false); // Lock window size
  ///   await WindowController.setResizable(true);  // Allow resizing
  ///   ```
  static Future<void> setResizable(bool resizable) async {
    try {
      await windowManager.setResizable(resizable);
    } catch (e) {
      print('Error setting window resizable property: $e');
    }
  }

  /// Configures the window for performance monitoring display.
  /// Sets a smaller window size optimized for showing performance metrics.
  /// The window will be always on top for easy monitoring.
  ///
  /// Example:
  ///   ```dart
  ///   await WindowController.setShowPerformanceSize();
  ///   ```
  static Future<void> setShowPerformanceSize() async {
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = const WindowOptions(
      size: Size(428, 370),
      center: true,
      backgroundColor: Colors.transparent,
      title: 'UDM Downloader',
      fullScreen: false,
      alwaysOnTop: true,
      windowButtonVisibility: true,
    );

    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.setSize(const Size(428, 370));
      await windowManager.show();
      await windowManager.focus();
    });
  }

  /// Changes the window title displayed in the title bar and taskbar.
  ///
  /// Parameters:
  ///   - title: The new title text to display
  ///
  /// Example:
  ///   ```dart
  ///   await WindowController.setWindowTitle('UDM Downloader - Downloading file.zip');
  ///   ```
  static Future<void> setWindowTitle(String title) async {
    await windowManager.setTitle(title);
  }

  /// Displays the current window size in the console for debugging purposes.
  /// Useful for development and troubleshooting window sizing issues.
  ///
  /// Example:
  ///   ```dart
  ///   await WindowController.showSize(); // Prints: "Current window size: (625, 300)"
  ///   ```
  static Future<void> showSize() async {
    final size = await windowManager.getSize();
    print("Current window size: (${size.width}, ${size.height})");
  }

  /// Closes the application window and terminates the application.
  /// This method provides a clean shutdown of the window and application.
  ///
  /// Example:
  ///   ```dart
  ///   // Close app on user request
  ///   await WindowController.closeApp();
  ///   ```
  static Future<void> closeApp() async {
    await windowManager.close();
  }
}
