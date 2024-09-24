

import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService{
  Future<dynamic> fetchData({required String url}) async {
    try {
      final response = await http.get(Uri.parse(url));
      return response;
    } catch (e) {
      throw Exception('Failed to fetch data. Error: $e');
    }
  }
}


