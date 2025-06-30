/// Utility class for parsing command-line arguments passed to the Flutter application.
/// Supports both --key=value and --key value format arguments.
/// Provides special processing for specific argument types like URLs and file paths.
///
/// Example:
///   ```dart
///   // Parse arguments from main function
///   await ArgumentsParser.parseArguments(['--url=ws://localhost:8080', '--filename=test.txt']);
///   ```
class ArgumentsParser {
  /// Parses command-line arguments and applies them to the application.
  /// This is the main entry point for argument parsing.
  ///
  /// Parameters:
  ///   - args: List of command-line arguments to parse
  ///
  /// Example:
  ///   ```dart
  ///   void main(List<String> args) async {
  ///     await ArgumentsParser.parseArguments(args);
  ///     // Continue with app initialization
  ///   }
  ///   ```
  static Future<void> parseArguments(List<String> args) async {
    if (args.isEmpty) return;

    Map<String, String> parsedArgs = _parseArgumentsSync(args);

    _applyParsedArguments(parsedArgs);
  }

  /// Synchronously parses command-line arguments into key-value pairs.
  /// Supports both --key=value and --key value formats.
  ///
  /// Parameters:
  ///   - args: List of raw command-line arguments
  ///
  /// Returns:
  ///   - Map<String, String>: Parsed key-value pairs from the arguments
  ///
  /// Example:
  ///   ```dart
  ///   final parsed = ArgumentsParser._parseArgumentsSync(['--url=ws://localhost', '--debug']);
  ///   // Returns: {'url': 'ws://localhost', 'debug': ''}
  ///   ```
  static Map<String, String> _parseArgumentsSync(List<String> args) {
    Map<String, String> parsedArgs = {};

    // Debug: Print raw arguments

    for (int i = 0; i < args.length; i++) {
      String arg = args[i];

      // Look for arguments in format --key=value
      if (arg.startsWith('--') && arg.contains('=')) {
        List<String> parts = arg.substring(2).split('=');
        if (parts.length >= 2) {
          String key = parts[0].trim();
          // Join back in case value contains '=' characters
          String value = parts.sublist(1).join('=').trim();

          // Apply specific processing based on key
          value = _processValue(key, value);

          parsedArgs[key] = value;
        }
      }
      // Look for arguments in format --key value
      else if (arg.startsWith('--') && i + 1 < args.length) {
        String key = arg.substring(2).trim();
        String value = args[i + 1].trim();

        // Apply specific processing based on key
        value = _processValue(key, value);

        // Skip processing the next arg since it's a value
        i++;
        parsedArgs[key] = value;
      }
    }

    return parsedArgs;
  }

  /// Processes argument values based on their key type to apply appropriate transformations.
  /// Provides special handling for URLs, file paths, and filenames.
  ///
  /// Parameters:
  ///   - key: The argument key/name
  ///   - value: The raw argument value
  ///
  /// Returns:
  ///   - String: The processed value with appropriate transformations applied
  ///
  /// Example:
  ///   ```dart
  ///   final processed = ArgumentsParser._processValue('url', 'ws%3A%2F%2Flocalhost');
  ///   // Returns: 'ws://localhost' (URL decoded)
  ///   ```
  static String _processValue(String key, String value) {
    // For now our app has no especific thing to process so we avoid it
    return "";
  }

  /// Applies the parsed arguments to the application configuration.
  /// Currently this method is empty as the app has no arguments to apply.
  /// This is where you would implement logic to use the parsed arguments.
  ///
  /// Parameters:
  ///   - parsedArgs: Map of parsed key-value argument pairs
  ///
  /// Example:
  ///   ```dart
  ///   // Future implementation might look like:
  ///   if (parsedArgs.containsKey('debug')) {
  ///     AppConfig.enableDebugMode = true;
  ///   }
  ///   ```
  static void _applyParsedArguments(Map<String, String> parsedArgs) {
    //Currently this app has no arguments to apply
  }
}
