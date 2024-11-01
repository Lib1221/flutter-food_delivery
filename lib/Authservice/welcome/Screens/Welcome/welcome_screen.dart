import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:check/second.dart';
import 'package:provider/provider.dart';

import '../../components/background.dart';
import '../../responsive.dart';
import 'components/login_signup_btn.dart';
import 'components/welcome_image.dart';



class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {

        final User? user = Provider.of<User?>(context);
        // return either the Home or Authenticate widget
        if (user == null) {
          return const WelcomeScreen();  // Show authentication screen when user is not signed in
        } else {
          return const homepage();  // Show the home screen when user is signed in
        }
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return const Background(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Responsive(
            desktop: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: WelcomeImage(),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 450,
                        child: LoginAndSignupBtn(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            mobile: MobileWelcomeScreen(),
          ),
        ),
      ),
    );
  }
}

class MobileWelcomeScreen extends StatelessWidget {
  const MobileWelcomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        WelcomeImage(),
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: LoginAndSignupBtn(),
            ),
            Spacer(),
            
          ],
        ),
        SizedBox(
          height: 20,
        ),
       
      ],
    );
  }
}
