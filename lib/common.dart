// ignore_for_file: use_super_parameters, must_be_immutable

import 'package:flutter/material.dart';

class ButtonNavBar3 extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabTapped;

  ButtonNavBar3({
    Key? key,
    required this.currentIndex,
    required this.onTabTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.all(10),
      height: screenWidth * .155,
      decoration: BoxDecoration(
        color: Colors.transparent,
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
        borderRadius: BorderRadius.circular(50),
        child: Container(
          color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.8),
          child: ListView.builder(
            itemCount: listOfIcons.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: screenWidth * .024),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                onTabTapped(index); // Call the callback function
              },
              child: Stack(
                children: [
                  SizedBox(
                    width: screenWidth * .2125,
                    child: Center(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
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
                          index == currentIndex ? const Color.fromARGB(255, 4, 96, 171) : Colors.black,
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
    Icons.location_on_outlined,
    Icons.shopping_cart_outlined,
    Icons.settings,
  ];
}