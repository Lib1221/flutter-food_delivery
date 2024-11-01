
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:check/main.dart';
import 'package:check/second.dart';
import 'package:provider/provider.dart';

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