// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:food_delivry/Authservice/auth.dart';
import 'package:food_delivry/a.dart';
import 'package:food_delivry/common.dart';
import 'package:lottie/lottie.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  AuthService signout = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        backgroundColor: Colors.redAccent,
        title: const Text('MesobXpress',
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_circle_right,
                size: 50,
                color: Colors.cyan,
              ),
              onPressed: () async {
                await signout.signOut();
              },
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                color: Colors.deepPurple,
                child: Center(
                  child: Lottie.network(
                    'https://lottie.host/43306f5c-eff3-49e9-a639-741b8152486e/tda8AOEQ70.json',
                    // Optional: Set a custom height
                    fit: BoxFit.fill, // Optional: Adjust the fit
                  ),
                ),
              )),
          const A(),
        ],
      ),
      bottomNavigationBar: const ButtonNavBar3(),
    );
  }
}
