import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_stats.dart';

class ApiService {
  static const String baseUrl = 'https://alfa-leetcode-api.onrender.com';

  // Function to fetch user stats by username
  Future<UserStats> fetchUserStats(String username) async {
    final url = Uri.parse('$baseUrl/$username/solved');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return UserStats.fromJson(data);
    } else {
      throw Exception('Failed to load user stats');
    }
  }
}
