import 'package:check/cart/cart.dart';
import 'package:check/map.dart';
import 'package:check/second.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ButtonNavBar3 extends StatefulWidget {
  const ButtonNavBar3({super.key});

  @override
  ButtonNavBar3State createState() => ButtonNavBar3State();
}

class ButtonNavBar3State extends State<ButtonNavBar3> {
  var currentIndex = 0;

  // List of pages corresponding to each icon
  final List<Widget> pages = [
    const homepage(),
    const deliveryRoute(),
    const Carts(),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.all(20),
      height: screenWidth * .155,
      decoration: BoxDecoration(
        color: Colors.transparent, // Set to transparent for the background
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.15),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(50),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50), // Ensure the child also respects the border radius
        child: Container(
          color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.8), // Background color with transparency
          child: ListView.builder(
            itemCount: listOfIcons.length, // Use listOfIcons length for item count
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: screenWidth * .024),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                setState(() {
                  currentIndex = index; // Update current index
                  HapticFeedback.lightImpact();
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => pages[index]),
                );
              },
            
              child: Stack(
                children: [
                  SizedBox(
                    width: screenWidth * .2125,
                    child: Center(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300), // Shorter duration for smoother animation
                        curve: Curves.fastLinearToSlowEaseIn,
                        height: index == currentIndex ? screenWidth * .12 : 0,
                        width: index == currentIndex ? screenWidth * .2125 : 0,
                        decoration: BoxDecoration(
                          color:
                              index == currentIndex ? Colors.blueAccent.withOpacity(.2) : Colors.transparent,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: screenWidth * .2125,
                    alignment: Alignment.center,
                    child: Icon(
                      listOfIcons[index],
                      size: screenWidth * .076,
                      color:
                          index == currentIndex ? const Color.fromARGB(255, 4, 96, 171) : Colors.black, // Change color based on selection
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.favorite_rounded,
    Icons.shopping_cart_outlined,
    Icons.person_rounded,
  ];
}
