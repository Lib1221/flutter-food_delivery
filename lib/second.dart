// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'Authservice/auth.dart';
import 'a.dart';
import 'new.dart';

class homepageScreening extends StatefulWidget {
  const homepageScreening({super.key});

  @override
  State<homepageScreening> createState() => homepageScreenState();
}

class homepageScreenState extends State<homepageScreening> {
  AuthService signout = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 4,
        backgroundColor: Color(0xFF0D47A1) ,
        title: const Text('MesobXpress',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFFE1F5FE) // Light Blue
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: IconButton(
                icon: const Icon(
                  Icons.logout_sharp,
                  size: 40,
                  color: Colors.black,
                ),
                onPressed: () async {
                  await signout.signOut();
                },
              ),
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

    );
  }
}
