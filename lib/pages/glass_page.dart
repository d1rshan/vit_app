// ignore_for_file: prefer_const_constructors

import 'package:comeback/comp/my_drawer.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

class GlassPage extends StatefulWidget {
  const GlassPage({super.key});

  @override
  State<GlassPage> createState() => _GlassPageState();
}

class _GlassPageState extends State<GlassPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Image.asset(
            'images/background.jpg', // Specify the path to your local image
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover, // Ensures the image covers the entire screen
          ),
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Expanded(
                // Use Expanded to fill available space properly
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GlassEffectContainer(
                      width: 200,
                      height: 50,
                      child: Center(
                        child: Text(
                          "Add Task",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10), // Add spacing between elements
                    GlassEffectContainer(
                      width: 200,
                      height: 50,
                      child: Center(
                        child: Text(
                          "Add Task",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: MyDrawer(),
    );
  }
}

class GlassEffectContainer extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;

  const GlassEffectContainer({
    super.key,
    required this.width,
    required this.height,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Reduced blur effect
          child: Container(
            alignment: Alignment.center,
            color: Colors.white.withOpacity(0.1),
            child: child,
          ),
        ),
      ),
    );
  }
}
