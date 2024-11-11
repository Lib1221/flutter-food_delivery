import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:check/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        centered: true,
        splashIconSize: 900,
        duration: 2000,
        splash:SvgPicture.asset('assets/icons/splash.svg',
          fit: BoxFit.fill,
          
        ),
        splashTransition: SplashTransition.fadeTransition,
        nextScreen: MyApp(),
      ),
    );
  }
}