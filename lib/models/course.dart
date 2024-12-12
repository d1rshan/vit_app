class Course {
  final String courseName;
  final String slot;
  final String teacherName;
  final String venue;

  Course({
    required this.courseName,
    required this.slot,
    required this.teacherName,
    required this.venue,
  });

  @override
  String toString() {
    return 'Course Name: $courseName, Slot: $slot, Teacher: $teacherName, Venue: $venue';
  }
}
