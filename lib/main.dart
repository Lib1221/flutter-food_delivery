<<<<<<< HEAD


import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:check/Authservice/welcome/Screens/Welcome/welcome_screen.dart';
import 'package:check/Authservice/welcome/constants.dart';
import 'package:check/Authservice/wrapper.dart';
import 'package:check/firebase_options.dart';
import 'package:provider/provider.dart';

import 'Authservice/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

=======
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivry/Authservice/auth.dart';
import 'package:food_delivry/Authservice/welcome/Screens/Welcome/welcome_screen.dart';
import 'package:food_delivry/Authservice/welcome/constants.dart';
import 'package:food_delivry/Authservice/wrapper.dart';
import 'package:food_delivry/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
>>>>>>> 531ceb1893ed0a4ad86901d9c7e15b3d9352732a
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User?>.value(
      value: AuthService().user,
      initialData: null,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper1(),
      ),
    );
  }
}


class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MesobExpress',
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              foregroundColor: Colors.white,
              backgroundColor: kPrimaryColor,
              shape: const StadiumBorder(),
              maximumSize: const Size(double.infinity, 56),
              minimumSize: const Size(double.infinity, 56),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: kPrimaryLightColor,
            iconColor: kPrimaryColor,
            prefixIconColor: kPrimaryColor,
            contentPadding: EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
          )),
      home: const WelcomeScreen(),
    );
  }
}
