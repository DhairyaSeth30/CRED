

import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService{
  Future<Map<String, dynamic>> fetchData({required String url}) async {

    try {
      // Making the API call
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Parsing the JSON data
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load data. Server returned status: ${response.statusCode}');
      }
    } catch (e) {
      // Handling any network or parsing errors
      throw Exception('Failed to fetch data. Error: $e');
    }
  }

}


