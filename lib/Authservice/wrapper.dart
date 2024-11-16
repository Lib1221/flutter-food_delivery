
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:check/main.dart';
import 'package:check/second.dart';
import 'package:provider/provider.dart';
=======
import 'package:food_delivry/main.dart';
import 'package:provider/provider.dart';
import '../second.dart';
>>>>>>> 531ceb1893ed0a4ad86901d9c7e15b3d9352732a

class Wrapper1 extends StatelessWidget {
  const Wrapper1({super.key});

  @override
  Widget build(BuildContext context) {

        final User? user = Provider.of<User?>(context);
        // return either the Home or Authenticate widget
        if (user == null) {
          return const MyApp2();  // Show authentication screen when user is not signed in
        } else {
          return const homepage();  // Show the home screen when user is signed in
        }
  }
}