```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      try {
        return jsonDecode(response.body);
      } on FormatException catch (e) {
        print('Error: Invalid JSON format - $e');
        return null; // Or throw a custom exception
      }
    } else {
      throw HttpException('HTTP request failed', response.statusCode, response.body);
    }
  } on SocketException catch (e) {
    print('Error: No Internet Connection - $e');
    return null; //Or throw a custom exception
  } on HttpException catch (e) {
    print('HTTP Error: ${e.message}, Status Code: ${e.statusCode}, Response Body: ${e.responseBody}');
    return null;//Or throw a custom exception
  } catch (e) {
    print('An unexpected error occurred: $e');
    return null;//Or throw a custom exception
  }
}

class HttpException implements Exception {
  final String message;
  final int statusCode;
  final String? responseBody;

  HttpException(this.message, this.statusCode, this.responseBody);

  @override
  String toString() => 'HttpException: $message, StatusCode: $statusCode, ResponseBody: $responseBody';
}
```