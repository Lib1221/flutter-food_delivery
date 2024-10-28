import 'package:flutter/material.dart';
import 'package:food_delivry/Authservice/auth.dart';

import '../../../screens/Signup/components/or_divider.dart';
import '../../../screens/Signup/components/social_icon.dart';

class SocalSignUp extends StatelessWidget {
  const SocalSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService google = AuthService();
    return Column(
      children: [
        const OrDivider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SocalIcon(
              iconSrc: "assets/icons/facebook.svg",
              press: () {},
            ),
            SocalIcon(
              iconSrc: "assets/icons/twitter.svg",
              press: () {},
            ),
            SocalIcon(
              iconSrc: "assets/icons/google-plus.svg",
              press: () async {
                dynamic result = await google.signInWithGoogle();
                print(result);
              },
            ),
          ],
        ),
      ],
    );
  }
}
