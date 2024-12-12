import 'dart:ui';

import 'package:comeback/models/course.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({super.key});

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  final TextEditingController _controller = TextEditingController();

  List<Course> courses = [];
  void perform() {
    // Raw timetable data (copy your data into this variable)
    String timetable = _controller.text;

    // Split each course data based on patterns
    courses = parseTimetable(timetable);

    // Print each course object to verify
    // for (var course in courses) {
    //   print(course);
    // }
  }

  List<Course> parseTimetable(String data) {
    List<Course> courses = [];

    // Split the data by a keyword that appears at the end of each course block
    List<String> courseBlocks = data.split("Registered and Approved");

    for (var block in courseBlocks) {
      if (block.trim().isEmpty) continue;

      // Extract course name
      RegExp courseNamePattern = RegExp(r"[A-Z]+\d+[A-Z]* - [^\n]+");
      String courseName =
          courseNamePattern.firstMatch(block)?.group(0) ?? "Unknown Course";

      // Extract slot
      RegExp slotPattern = RegExp(r"[A-Z0-9\+]+ -\s*\n");
      String slot = slotPattern
              .firstMatch(block)
              ?.group(0)
              ?.replaceAll(" -", "")
              .trim() ??
          "Unknown Slot";

      // Extract venue
      RegExp venuePattern = RegExp(r"AB\d+-\d+");
      String venue =
          venuePattern.firstMatch(block)?.group(0) ?? "Unknown Venue";

      String teacherName = getTeacherNameAfterVenue(block, venue);

      // Create a Course object and add it to the list
      courses.add(Course(
        courseName: courseName,
        slot: slot,
        teacherName: teacherName,
        venue: venue,
      ));
    }

    return courses;
  }

  String getTeacherNameAfterVenue(String block, String venue) {
    // Split the block by new lines to find the venue and the following lines
    List<String> lines = block.split('\n');

    // Find the index of the line that contains the venue
    int venueIndex = lines.indexWhere((line) => line.contains(venue));

    // Check for the next non-empty line after the venue
    if (venueIndex != -1) {
      for (int i = venueIndex + 1; i < lines.length; i++) {
        if (lines[i].trim().isNotEmpty) {
          return lines[i].trim(); // Return the first non-empty line
        }
      }
    }
    return "Unknown Teacher"; // Fallback if not found
  }

  //  String text = _controller.text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'Time Table',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 150,
              child: SingleChildScrollView(
                child: TextField(
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  onTapOutside: (value) {
                    perform();
                    setState(() {});
                  },
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Paste here!',
                    hintStyle: GoogleFonts.poppins(),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.5,
                        color: Colors.white,
                      ),
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 5,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  return Text(courses[index].toString() + '\n');
                },
              ),
            ),
          ],
        ));
  }
}
