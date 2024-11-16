// ignore_for_file: camel_case_types

<<<<<<< HEAD
import 'package:check/common.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'Authservice/auth.dart';
import 'a.dart';
=======
import 'package:flutter/material.dart';
import 'package:food_delivry/Authservice/auth.dart';
import 'package:food_delivry/a.dart';
import 'package:food_delivry/common.dart';
import 'package:lottie/lottie.dart';
>>>>>>> 531ceb1893ed0a4ad86901d9c7e15b3d9352732a

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
<<<<<<< HEAD
                fontSize: 30,
=======
                fontSize: 40,
>>>>>>> 531ceb1893ed0a4ad86901d9c7e15b3d9352732a
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
