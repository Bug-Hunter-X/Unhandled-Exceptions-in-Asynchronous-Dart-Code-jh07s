```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data. Status code: ${response.statusCode}');
    }
  } on SocketException catch (e) {
    print('Network error: $e');
    // Handle network errors (e.g., show a message to the user)
    return null; // Or return cached data if available
  } on FormatException catch (e) {
    print('JSON decoding error: $e');
    // Handle JSON decoding errors
    return null;
  } catch (e) {
    print('An unexpected error occurred: $e');
    // Handle other exceptions
    return null;
  }
}
```