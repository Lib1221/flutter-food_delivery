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
    const deliveryRoute()
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    
    return Container(
        margin: const EdgeInsets.all(20),
        height: screenWidth * .155,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
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
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
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
                        index == currentIndex ? Colors.blueAccent : Colors.black26, // Change color based on selection
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.favorite_rounded,
    Icons.settings_rounded,
    Icons.person_rounded,
  ];
}

