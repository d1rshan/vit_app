import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewPage extends StatelessWidget {
  NewPage({super.key});

  void goBack() {
    controller.previousPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.fastEaseInToSlowEaseOut,
    );
  }

  void goNext() {
    controller.nextPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.fastEaseInToSlowEaseOut,
    );
  }

  final PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: PageView(
                onPageChanged: (value) {},
                physics: const ClampingScrollPhysics(),
                controller: controller,
                children: [
                  Container(
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        "1",
                        style: GoogleFonts.poppins(fontSize: 100),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.amber,
                    child: Center(
                      child: Text(
                        "2",
                        style: GoogleFonts.poppins(fontSize: 100),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.green,
                    child: Center(
                      child: Text(
                        "3",
                        style: GoogleFonts.poppins(fontSize: 100),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: goBack,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.white,
                  child: const Icon(
                    Icons.arrow_left,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              GestureDetector(
                onTap: goNext,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.white,
                  child: const Icon(
                    Icons.arrow_right,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
