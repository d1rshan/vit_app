import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.deepPurpleAccent,
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              const CircleAvatar(
                radius: 50,
                backgroundColor: Color.fromARGB(255, 198, 177, 255),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 45,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Darshan Paccha',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'darshan.paccha@gmail.com',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                color: Colors.white,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
          ListTile(
            title: Text(
              'Mess Menu',
              style: GoogleFonts.poppins(),
            ),
            onTap: () {
              // Handle item tap
              Navigator.pushNamed(context, '/mess');
            },
          ),
          ListTile(
            title: Text(
              'Announcements',
              style: GoogleFonts.poppins(),
            ),
            onTap: () {
              // Handle item tap
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  'No Announcements!',
                  style: GoogleFonts.poppins(
                    color: Colors.deepPurpleAccent,
                  ),
                ),
                backgroundColor: Colors.white,
                duration: const Duration(seconds: 2), // Optional duration
              ));
            },
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/leetcode');
            },
            title: Text(
              "Leetcode",
              style: GoogleFonts.poppins(),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/glass_page');
            },
            title: Text(
              "Glass Effect",
              style: GoogleFonts.poppins(),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/time_table');
            },
            title: Text(
              "Time Table",
              style: GoogleFonts.poppins(),
            ),
          )
        ],
      ),
    );
  }
}
