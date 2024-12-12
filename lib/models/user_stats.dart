class UserStats {
  final int easySolved;
  final int mediumSolved;
  final int hardSolved;

  UserStats({
    required this.easySolved,
    required this.mediumSolved,
    required this.hardSolved,
  });

  // Factory constructor to parse JSON data
  factory UserStats.fromJson(Map<String, dynamic> json) {
    return UserStats(
      easySolved: json['easySolved'],
      mediumSolved: json['mediumSolved'],
      hardSolved: json['hardSolved'],
    );
  }
}
