import 'package:flutter/material.dart';
<<<<<<< HEAD

import 'or_divider.dart';
import 'social_icon.dart';
=======
import 'package:food_delivry/Authservice/auth.dart';

import '../../../screens/Signup/components/or_divider.dart';
import '../../../screens/Signup/components/social_icon.dart';
>>>>>>> 531ceb1893ed0a4ad86901d9c7e15b3d9352732a

class SocalSignUp extends StatelessWidget {
  const SocalSignUp({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
=======
    AuthService google = AuthService();
>>>>>>> 531ceb1893ed0a4ad86901d9c7e15b3d9352732a
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
<<<<<<< HEAD
                
=======
                dynamic result = await google.signInWithGoogle();
                print(result);
>>>>>>> 531ceb1893ed0a4ad86901d9c7e15b3d9352732a
              },
            ),
          ],
        ),
      ],
    );
  }
}
