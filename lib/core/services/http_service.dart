// lib/core/services/http_service.dart
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpService {
  Future<Map<String, dynamic>> get(String url) async {
    final response = await http.get(Uri.parse(url));
    
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}