// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class auth extends StatefulWidget {
  const auth({super.key});

  @override
  State<auth> createState() => _authState();
}

class _authState extends State<auth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 27, 221, 255),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              color: const Color.fromARGB(255, 27, 221, 255),
              child: const Center(
                child: Icon(
                  Icons.delivery_dining_rounded,
                  size: 120,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50),
                  )),
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    Container(
                      height: 60,
                      width: 200,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 179, 192, 2),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Signup',
                            style: TextStyle(fontSize: 30, color: Colors.black),
                          )),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                        height: 60,
                        width: 200,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 179, 192, 2),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/home');
                            },
                            child: const Text(
                              'Login',
                              style:
                                  TextStyle(fontSize: 30, color: Colors.black),
                            ))),
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      'MesobXpress',
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.cyan),
                    ),
                    const Text(
                      'From our hands to yours,wherever you are',
                      textAlign: TextAlign.center,
                      softWrap: true,
                      style: TextStyle(fontSize: 30, color: Colors.white10),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
