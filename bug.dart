```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Incorrect handling of JSON data. Missing error handling
      final jsonData = jsonDecode(response.body);
      // Use jsonData
    } else {
      //Throwing a general exception here will mask the original error from the server
      throw Exception('Failed to load data');
    }
  } catch (e) {
    // This catch block is too general. It does not provide specific information
    print('Error: $e');
  }
}
```