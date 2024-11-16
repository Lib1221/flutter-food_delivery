// ignore_for_file: camel_case_types

import 'package:check/cart/cart.dart';
import 'package:check/common.dart';
import 'package:check/dashboard.dart';
import 'package:check/maps/map.dart';
import 'package:check/second.dart';
import 'package:flutter/material.dart';

class mainpage extends StatefulWidget {
  const mainpage({super.key});

  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const homepageScreening(), // Replace with your actual home page widget
    const deliveryRoute(), // Replace with your delivery route widget
    const Carts(),
Dashboard()  ];

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: ButtonNavBar3(
        currentIndex: currentIndex,
        onTabTapped: onTabTapped,
      ),
    );
  }
}