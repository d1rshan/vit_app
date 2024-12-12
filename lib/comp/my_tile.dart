import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String getText(int index) {
  if (index == 0) {
    return "Breakfast";
  } else if (index == 1) {
    return "Lunch";
  }
  return "Dinner";
}

class MyTile extends StatelessWidget {
  final int index;
  final String text;
  const MyTile({
    super.key,
    required this.text,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            getText(index),
            style: GoogleFonts.poppins(
              color: Colors.deepPurpleAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            text,
            style: GoogleFonts.poppins(
              color: Colors.deepPurpleAccent,
            ),
          ),
        ],
      ),
    );
  }
}
