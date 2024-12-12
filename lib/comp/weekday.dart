import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeekDay extends StatelessWidget {
  final String text;

  final bool isSelected;
  const WeekDay({required this.isSelected, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: (MediaQuery.sizeOf(context).width - 30) * 0.1,
      height: (MediaQuery.sizeOf(context).height) * 0.05,
      // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: StadiumBorder(
          side: isSelected
              ? const BorderSide(
                  color: Color.fromARGB(255, 198, 177, 255),
                  width: 4,
                  style: BorderStyle.solid,
                  strokeAlign: BorderSide.strokeAlignOutside,
                )
              : BorderSide.none,
        ),
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          color: Colors.deepPurpleAccent,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
