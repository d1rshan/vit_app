import 'package:comeback/comp/my_drawer.dart';
import 'package:comeback/models/user_stats.dart';
import 'package:comeback/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LeetcodePage extends StatefulWidget {
  const LeetcodePage({super.key});

  @override
  State<LeetcodePage> createState() => _LeetcodePageState();
}

class _LeetcodePageState extends State<LeetcodePage> {
  final ApiService apiService = ApiService();
  final TextEditingController _usernameController = TextEditingController();
  UserStats? userStats;
  bool isLoading = false;
  String errorMessage = '';

  void fetchStats() async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    try {
      final stats = await apiService.fetchUserStats(_usernameController.text);
      setState(() {
        userStats = stats;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'User not found or network error';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int totalSolved = 0;
    if (userStats != null) {
      totalSolved = userStats!.easySolved +
          userStats!.mediumSolved +
          userStats!.hardSolved;
    }

    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        title: Text(
          'Leetcode User Stats',
          style: GoogleFonts.poppins(),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Enter LeetCode Username',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: fetchStats,
              child: const Text('Fetch Stats'),
            ),
            const SizedBox(height: 20),
            if (isLoading) const CircularProgressIndicator(),
            if (errorMessage.isNotEmpty)
              Text(errorMessage, style: const TextStyle(color: Colors.red)),
            if (userStats != null)
              Column(
                children: [
                  Text('Easy: ${userStats!.easySolved}'),
                  Text('Medium: ${userStats!.mediumSolved}'),
                  Text('Hard: ${userStats!.hardSolved}'),
                  Text('Total: $totalSolved'),
                ],
              ),
          ],
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
