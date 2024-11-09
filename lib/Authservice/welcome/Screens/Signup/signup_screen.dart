import 'package:check/Authservice/welcome/components/background.dart';
import 'package:check/Authservice/welcome/constants.dart';
import 'package:check/Authservice/welcome/responsive.dart';
import 'package:flutter/material.dart';
import 'components/signup_form.dart';
import 'components/socal_sign_up.dart';
import 'components/sign_up_top_image.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: const MobileSignupScreen(),
          desktop: Row(
            children: [
              const Expanded(
                child: SignUpScreenTopImage(),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 450,
                      child: SignupForm(),
                    ),
                    const SizedBox(height: defaultPadding / 2),
                    const SocalSignUp()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MobileSignupScreen extends StatelessWidget {
  const MobileSignupScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SignUpScreenTopImage(),
              Row(
                children: [
                  const Spacer(),
                  Expanded(
                    flex: 8,
                    child: SignupForm(),
                  ),
                  const Spacer(),
                ],
              ),
              const SocalSignUp()
            ],
          );
  }
}
