// ignore_for_file: prefer_const_constructors

import 'package:comeback/comp/my_drawer.dart';
import 'package:comeback/comp/my_tile.dart';
import 'package:comeback/comp/weekday.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
  int selectedDay = 0;

  List menu = [
    [
      "1. Pancakes with syrup\n2. Fruit salad\n3. Scrambled eggs\n4. Coffee\n5. Bacon strips\n6. Orange juice",
      "1. Caesar salad\n2. Grilled chicken\n3. Croutons\n4. Parmesan cheese\n5. Caesar dressing\n6. Garlic bread",
      "1. Grilled salmon with veggies\n2. Rice pilaf\n3. Steamed broccoli\n4. Lemon wedges\n5. Herb butter"
    ],
    [
      "1. Avocado toast\n2. Poached egg\n3. Cherry tomatoes\n4. Feta cheese\n5. Basil\n6. Olive oil",
      "1. Chicken wrap\n2. Lettuce\n3. Tomato\n4. Avocado\n5. Chipotle sauce\n6. Tortilla",
      "1. Spaghetti Bolognese\n2. Garlic bread\n3. Parmesan cheese\n4. Mixed green salad\n5. Red wine"
    ],
    [
      "1. Omelette with mushrooms\n2. Spinach\n3. Cheddar cheese\n4. Sourdough toast\n5. Hot sauce",
      "1. Sushi platter\n2. California rolls\n3. Tuna sashimi\n4. Edamame\n5. Wasabi",
      "1. Beef stir-fry\n2. Bell peppers\n3. Broccoli\n4. Rice noodles\n5. Soy sauce\n6. Sesame seeds"
    ],
    [
      "1. French toast\n2. Maple syrup\n3. Berries\n4. Whipped cream\n5. Powdered sugar",
      "1. Quinoa salad\n2. Chickpeas\n3. Cucumber\n4. Feta cheese\n5. Lemon vinaigrette",
      "1. Lamb chops with mashed potatoes\n2. Mint sauce\n3. Steamed carrots\n4. Gravy"
    ],
    [
      "1. Smoothie bowl\n2. Banana\n3. Spinach\n4. Granola\n5. Almond butter\n6. Chia seeds",
      "1. Turkey sandwich\n2. Lettuce\n3. Tomato\n4. Swiss cheese\n5. Mustard\n6. Whole grain bread",
      "1. Vegetable curry with rice\n2. Naan bread\n3. Raita\n4. Pickles"
    ],
    [
      "1. Bagel with cream cheese\n2. Smoked salmon\n3. Capers\n4. Red onion\n5. Cucumber",
      "1. Fish tacos\n2. Cabbage slaw\n3. Avocado\n4. Salsa\n5. Lime wedges",
      "1. BBQ ribs with coleslaw\n2. Cornbread\n3. Baked beans"
    ],
    [
      "1. Yogurt parfait\n2. Granola\n3. Mixed berries\n4. Honey\n5. Nuts",
      "1. Margherita pizza\n2. Fresh basil\n3. Mozzarella cheese\n4. Tomato sauce\n5. Olive oil",
      "1. Chicken biryani\n2. Raita\n3. Salad\n4. Papadum"
    ]
  ];

  PageController controller = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepPurpleAccent,
        actions: const [
          Icon(Icons.home, color: Colors.white),
          SizedBox(width: 20),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Text(
                "Hello, Darshan\nPaccha!👋",
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(days.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      controller.animateToPage(
                        index,
                        duration: Duration(milliseconds: 200),
                        curve: Curves.fastEaseInToSlowEaseOut,
                      );
                    },
                    child: WeekDay(
                      isSelected: index == selectedDay,
                      text: days[index],
                    ),
                  );
                }),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: PageView.builder(
                controller: controller,
                pageSnapping: true,
                onPageChanged: (index) {
                  setState(() {
                    selectedDay = index;
                  });
                },
                itemCount: menu.length,
                itemBuilder: (context, index) {
                  return ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    itemCount: 3,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, innerIndex) => MyTile(
                        text: menu[index][innerIndex], index: innerIndex),
                  );
                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
