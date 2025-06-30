// wsclient.dart
// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';

typedef EventHandler = void Function(Map<String, dynamic> data);

/// WebSocket client class for managing real-time communication with a server.
/// Provides event-based messaging with support for different message types (on, ask, given).
/// Automatically reconnects on connection failures.
///
/// Example:
///   ```dart
///   final client = wsClient();
///   await client.connect('ws://localhost:8080');
///
///   client.on('message', (data) {
///     print('Received: ${data['content']}');
///   });
///
///   client.emit('send_message', {'content': 'Hello World'});
///   ```
class wsClient {
  late WebSocketChannel _channel;
  final Map<String, EventHandler> _onHandlers = {};
  final Map<String, EventHandler> _askHandlers = {};
  final Map<String, EventHandler> _givenHandlers = {};

  /// Establishes a WebSocket connection to the specified URL with automatic retry on failure.
  /// The method will keep attempting to connect until successful.
  ///
  /// Parameters:
  ///   - url: The WebSocket URL to connect to (e.g., 'ws://localhost:8080')
  ///
  /// Example:
  ///   ```dart
  ///   final client = wsClient();
  ///   await client.connect('ws://localhost:8080/websocket');
  ///   ```
  Future<void> connect(String url) async {
    while (true) {
      try {
        _channel = WebSocketChannel.connect(Uri.parse(url));
        break;
      } catch (e) {
        print("Error connecting to WebSocket: $e. Retrying in 1 second...");
        await Future.delayed(const Duration(seconds: 1));
      }
    }
    startListenStream();
  }

  /// Starts listening to incoming WebSocket messages and routes them to appropriate handlers.
  /// Messages are expected to have the format: {'event': string, 'sender': string, 'data': object}
  /// Only processes messages where sender is 'server'.
  ///
  /// Example message format:
  ///   ```json
  ///   {
  ///     "event": "user_joined",
  ///     "sender": "server",
  ///     "data": {"userId": "123", "username": "john"}
  ///   }
  ///   ```
  void startListenStream() {
    _channel.stream.listen((message) {
      final Map<String, dynamic> jsonData = json.decode(message);
      final String event = jsonData['event'];
      final String sender = jsonData['sender'];
      final Map<String, dynamic> data = jsonData['data'];

      if (_onHandlers.containsKey(event) && sender == 'server') {
        _onHandlers[event]!(data);
      } else if (_askHandlers.containsKey(event) && sender == 'server') {
        _askHandlers[event]!(data);
      } else if (_givenHandlers.containsKey(event) && sender == 'server') {
        _givenHandlers[event]!(data);
      }
    });
  }

  /// Sends an event message to the server with specified data.
  /// This is for general event broadcasting.
  ///
  /// Parameters:
  ///   - event: The event name/type to send
  ///   - data: The data payload to send with the event
  ///
  /// Example:
  ///   ```dart
  ///   client.emit('user_typing', {'userId': '123', 'isTyping': true});
  ///   ```
  void emit(String event, Map<String, dynamic> data) {
    _send(event, 'client', data);
  }

  /// Sends an event message to all connected clients via the server.
  /// Similar to emit but intended for broadcast messages.
  ///
  /// Parameters:
  ///   - event: The event name/type to broadcast
  ///   - data: The data payload to send with the event
  ///
  /// Example:
  ///   ```dart
  ///   client.emitAll('announcement', {'message': 'Server maintenance in 5 minutes'});
  ///   ```
  void emitAll(String event, Map<String, dynamic> data) {
    _send(event, 'client', data);
  }

  /// Sends a request/question event to the server, typically expecting a response.
  /// Use this when you need to request specific information from the server.
  ///
  /// Parameters:
  ///   - event: The request event name/type
  ///   - data: The request data payload
  ///
  /// Example:
  ///   ```dart
  ///   client.ask('get_user_profile', {'userId': '123'});
  ///   ```
  void ask(String event, Map<String, dynamic> data) {
    _send(event, 'client', data);
  }

  /// Sends data to the server for a specific event.
  /// General purpose method for sending any type of data.
  ///
  /// Parameters:
  ///   - event: The event name/type to send data for
  ///   - data: The data payload to send
  ///
  /// Example:
  ///   ```dart
  ///   client.sendData('file_upload', {'fileName': 'document.pdf', 'size': 1024});
  ///   ```
  void sendData(String event, Map<String, dynamic> data) {
    _send(event, 'client', data);
  }

  /// Internal method to send formatted messages through the WebSocket connection.
  /// Encodes the message as JSON with event, sender, and data fields.
  ///
  /// Parameters:
  ///   - event: The event name/type
  ///   - sender: The message sender identifier (typically 'client')
  ///   - data: The data payload to send
  void _send(String event, String sender, Map<String, dynamic> data) {
    final message = json.encode({
      'event': event,
      'sender': sender,
      'data': data,
    });
    _channel.sink.add(message);
  }

  /// Registers an event handler for incoming server messages of the specified event type.
  /// Use this for general server notifications and updates.
  ///
  /// Parameters:
  ///   - event: The event name/type to listen for
  ///   - handler: The callback function to execute when the event is received
  ///
  /// Example:
  ///   ```dart
  ///   client.on('user_connected', (data) {
  ///     print('User ${data['username']} connected');
  ///   });
  ///   ```
  void on(String event, EventHandler handler) {
    _onHandlers[event] = handler;
  }

  /// Registers an event handler for incoming server requests/questions.
  /// Use this to handle requests from the server that may require a response.
  ///
  /// Parameters:
  ///   - event: The request event name/type to listen for
  ///   - handler: The callback function to execute when the request is received
  ///
  /// Example:
  ///   ```dart
  ///   client.whenAsked('provide_status', (data) {
  ///     print('Server asking for status');
  ///     // You might want to respond with client.sendData()
  ///   });
  ///   ```
  void whenAsked(String event, EventHandler handler) {
    _askHandlers[event] = handler;
  }

  /// Registers an event handler for incoming server data/responses.
  /// Use this to handle data that the server provides or sends proactively.
  ///
  /// Parameters:
  ///   - event: The data event name/type to listen for
  ///   - handler: The callback function to execute when the data is received
  ///
  /// Example:
  ///   ```dart
  ///   client.whenGiven('user_profile', (data) {
  ///     print('Received user profile: ${data['name']}');
  ///   });
  ///   ```
  void whenGiven(String event, EventHandler handler) {
    _givenHandlers[event] = handler;
  }

  /// Closes the WebSocket connection and cleans up resources.
  /// Call this when you're done with the WebSocket client to prevent memory leaks.
  ///
  /// Example:
  ///   ```dart
  ///   client.dispose();
  ///   ```
  void dispose() {
    _channel.sink.close();
  }
}
